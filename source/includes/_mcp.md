# MCP Server

StratiFi serves a [Model Context Protocol](https://modelcontextprotocol.io) (MCP) server, so AI assistants such as
Claude, ChatGPT and other MCP clients can work with an advisor's data. Every tool mirrors an action of this REST API
and runs the same permissions and validation, so a tool sees exactly what the matching REST call would.

| Item       | Value                                       |
|------------|---------------------------------------------|
| Endpoint   | `https://backend.stratifi.com/mcp`          |
| Transport  | Streamable HTTP, stateless JSON responses (one JSON-RPC message per `POST`; no session id and no server-initiated stream) |
| Protocol   | MCP `2024-11-05` to `2025-11-25`; send the version you use in the `MCP-Protocol-Version` header |
| Auth       | OAuth 2 bearer token (see [Connecting a client](#connecting-a-client)) |
| Rate limit | 1000 requests per hour per user by default; over the limit the endpoint answers `429` |

<aside class="notice">
Replace <code>backend.stratifi.com</code> with <code>sandbox.stratifi.com</code> for the sandbox environment.
</aside>

## Connecting a client

Most MCP clients only need the endpoint URL. On the first request without a token the server answers `401` with a
`WWW-Authenticate` header pointing at its metadata, and the client runs the OAuth flow from there:

1. **Discovery.** The protected-resource metadata (RFC 9728) names the authorization server and the scopes:
   `GET https://backend.stratifi.com/.well-known/oauth-protected-resource/mcp`. The authorization server metadata
   (RFC 8414) lists the endpoints: `GET https://backend.stratifi.com/.well-known/oauth-authorization-server/o`.
2. **Registration.** A client without a client id registers itself (RFC 7591) at `POST /o/register/`, or you use a
   client id issued by StratiFi.
3. **Authorization.** The user signs in to StratiFi, sees the consent page and approves the requested scopes. The client
   uses the [authorization code flow with PKCE](#authorization-code-flow-pcke).
4. **Calls.** The client sends `Authorization: Bearer {{ access-token }}` on every request to `/mcp` and refreshes the
   token with the [refresh token flow](#refresh-token-flow).

### Scopes

| Scope   | Grants                                              |
|---------|-----------------------------------------------------|
| `read`  | The list and get tools                              |
| `write` | The create, update and delete tools                 |

A tool called without the scope it needs answers with an `insufficient_scope` tool error.

### Resource-bound tokens

A client can ask for a token bound to the MCP server by sending `resource=https://backend.stratifi.com/mcp` on the
authorization and token requests (RFC 8707). Such a token only works on `/mcp`; it is refused by `/api/v1/`, and a token
issued for another resource is refused by `/mcp`. Tokens issued without a resource work on both.

### Dynamic client registration

```shell
curl -X POST "https://backend.stratifi.com/o/register/" -H "Content-Type: application/json" \
  -d '{
    "client_name": "My assistant",
    "redirect_uris": ["https://assistant.example.com/oauth/callback"],
    "grant_types": ["authorization_code", "refresh_token"],
    "response_types": ["code"]
  }'
```

> The response is the registered client (RFC 7591), with its `client_id` and a `registration_access_token`.

| Rule              | Detail                                                                                   |
|-------------------|------------------------------------------------------------------------------------------|
| Redirect URIs     | 1 to 10. Each must be `https://`, or `http://` on a loopback host (`localhost`, `127.0.0.1`, `::1`, any port). No whitespace, credentials (`user@host`) or invalid port |
| Grant types       | Must include `authorization_code`; `refresh_token` is the only other one accepted        |
| Response types    | `code` only                                                                              |
| Rate limit        | 20 registrations per hour per client address; over it the answer is `429` with `{"error": "slow_down"}` and a `Retry-After` header |
| Errors            | `400` with an RFC 7591 body, for example `{"error": "invalid_redirect_uri", "error_description": "..."}` |

The registration can be read (`GET`) or deleted (`DELETE`) at `/o/register/<client_id>/` with the
`registration_access_token` as a bearer token, for 30 days. Updates are not supported; register again instead.

A self-registered app is shown on the consent page as **Unverified app**, together with the host the user will be sent
to, so the user can confirm it is the service they set up.

## Tools

The `tools/list` method returns the full catalogue with a JSON Schema for each tool's arguments. The schemas are built
from the same serializers as this API, so the fields, types, enums and descriptions match the REST documentation.

| Resource                 | Tools                                                                                                           |
|--------------------------|-----------------------------------------------------------------------------------------------------------------|
| Households               | `list_households`, `get_household`, `create_household`, `update_household`, `delete_household`, `get_household_prism_aggregation` |
| Investors                | `list_investors`, `get_investor`, `create_investor`, `update_investor`, `delete_investor`, `get_investor_prism_aggregation` |
| Accounts                 | `list_accounts`, `get_account`, `create_account`, `update_account`, `delete_account`, `get_account_prism_score` |
| Model portfolios         | `list_model_portfolios`, `get_model_portfolio`, `create_model_portfolio`, `update_model_portfolio`, `delete_model_portfolio`, `get_model_portfolio_prism_score` |
| Securities               | `get_security` (by `ticker` or `cusip`, exactly one)                                                            |
| Surveillance exceptions  | `list_surveillance_exceptions`, `get_surveillance_exception` (read only)                                        |
| Identity                 | `whoami`: the user behind the token, with `advisor_id` and `company_id` (`null` for API-only users)             |

- **Ids** are StratiFi integer ids. Use a `list_*` tool, with its filters, to find them before calling `get_*`,
  `update_*` or `delete_*`. Call `whoami` first to learn which advisor and company the token acts as.
- **Lists** take the same filters as the REST list endpoint, plus `page` and `page_size`, and return `count`, `page`,
  `page_size`, `total_pages` and `results`.
- **Updates** are partial: send only the fields to change. Sending `positions` replaces the whole list, as over REST.
  Read-only fields of nested items (a position's `id`, `created_at`, `updated_at`) are accepted and ignored, so a
  record can be written back as it was read.

## Results and errors

A tool result carries the data twice: as JSON text in `content` and as an object in `structuredContent`.

When a tool cannot do what was asked, the result has `isError: true` and `structuredContent.error` explains why, so the
assistant can correct the call and retry:

```json
{
  "isError": true,
  "structuredContent": {
    "error": {
      "code": "validation_error",
      "message": "The request was rejected by validation.",
      "details": {"investor": ["An investor (or an advisor to fall back on) is required."]}
    }
  }
}
```

| Code                 | Meaning                                                                        |
|----------------------|--------------------------------------------------------------------------------|
| `invalid_arguments`  | The arguments do not match the tool's schema; `details` lists each problem     |
| `validation_error`   | The API rejected the data; `details` has the field errors, as a REST `400` would |
| `not_found`          | No object with that id or lookup is visible to the user                        |
| `ambiguous`          | A lookup matched more than one object; look it up by another identifier        |
| `forbidden`          | The user may not do this, as a REST `403` would                                 |
| `insufficient_scope` | The token does not carry the scope the tool needs                              |
| `limit_exceeded`     | The firm has reached a plan limit for this action                              |
| `throttled`          | Too many requests; retry later                                                 |
| `internal_error`     | An unexpected failure; it has been reported to StratiFi                        |

Problems with the JSON-RPC message itself (malformed JSON, an unknown method or tool, an unsupported protocol version)
are answered as JSON-RPC errors instead.
