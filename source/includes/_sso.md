# Single Sign-On

StratiFi supports SAML 2.0 Single Sign-On so your platform can send an advisor straight into the StratiFi web app
without a StratiFi login screen. StratiFi acts as the SAML **Service Provider (SP)**; your platform is the
**Identity Provider (IdP)**. SSO is provisioned per firm — contact support@stratifi.com to set it up.

## Service Provider endpoints

Your SP endpoints are templated by a short **org slug** assigned to your firm. Download the metadata document from the
metadata URL to configure your IdP; the SP Entity ID is that same metadata URL.

| Endpoint                  | URL                                                              |
|---------------------------|------------------------------------------------------------------|
| Metadata (SP Entity ID)   | `https://backend.stratifi.com/sso/saml/{{ org_slug }}/metadata/` |
| ACS (assertion consumer)  | `https://backend.stratifi.com/sso/saml/{{ org_slug }}/acs/`      |
| SLS (single logout)       | `https://backend.stratifi.com/sso/saml/{{ org_slug }}/sls/`      |

<aside class="notice">
Replace <code>backend.stratifi.com</code> with <code>sandbox.stratifi.com</code> for the sandbox environment.
</aside>

## IdP-initiated sign-in

Your IdP issues a signed SAML assertion for the advisor and your application POSTs it to the ACS, optionally with a
`RelayState` that deep-links the advisor to a specific page:

```html
<form method="POST" action="https://backend.stratifi.com/sso/saml/{{ org_slug }}/acs/">
  <input type="hidden" name="SAMLResponse" value="{{ base64_signed_saml_response }}"/>
  <input type="hidden" name="RelayState"  value="/advisor/investors/{{ investor_id }}"/>
</form>
```

## RelayState deep-link

`RelayState` opens StratiFi on a specific page after sign-in. It must be a **bare, same-origin path**: it starts with
`/` and has no scheme, host, query string or fragment (for example `/advisor/investors/42`). StratiFi prepends its own
app origin, so the advisor lands at `https://advisors.stratifi.com/advisor/investors/42`. A value that is not a bare
same-origin path is ignored and the advisor lands on the StratiFi home page; omit `RelayState` for a plain sign-in.

The id in the path is the StratiFi **investor id**, not your external id — resolve it first with
`GET /investors/?external_id={{ your_id }}`.

| Description               | RelayState path             |
|---------------------------|-----------------------------|
| Clients list              | `/advisor/investors/`       |
| Client overview           | `/advisor/investors/<id>`   |
| Prospects list            | `/advisor/prospects/`       |
| Prospect overview         | `/advisor/prospects/<id>`   |
| Households list           | `/advisor/households/`      |
| Model Portfolios list     | `/advisor/models/`          |

## Requirements

- IdP-initiated SSO must be enabled for your firm (StratiFi configures this during setup).
- The SAML assertion must be **signed**.
- The **NameID carries the advisor's email** (format `emailAddress` or `unspecified`); StratiFi matches it to an advisor.
- The advisor must already exist as an active advisor in StratiFi with a matching email — there is **no** just-in-time
  provisioning.
