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
| Login (SP-initiated)      | `https://backend.stratifi.com/sso/saml/{{ org_slug }}/login/`    |

<aside class="notice">
Replace <code>backend.stratifi.com</code> with <code>sandbox.stratifi.com</code> for the sandbox environment.
</aside>

## Starting sign-in

An advisor can start SSO from either side:

| Trigger       | Where the advisor starts                              | What happens                                                    |
|---------------|-------------------------------------------------------|-----------------------------------------------------------------|
| IdP-initiated | Your IdP or your own application                      | Your IdP POSTs a signed assertion to the StratiFi ACS.          |
| SP-initiated  | The StratiFi sign-in page ("Sign in with SSO")        | StratiFi sends the advisor to your IdP, which returns to the ACS. |

### IdP-initiated sign-in

Your IdP issues a signed SAML assertion for the advisor and your application POSTs it to the ACS, optionally with a
`RelayState` that deep-links the advisor to a specific page:

```html
<form method="POST" action="https://backend.stratifi.com/sso/saml/{{ org_slug }}/acs/">
  <input type="hidden" name="SAMLResponse" value="{{ base64_signed_saml_response }}"/>
  <input type="hidden" name="RelayState"  value="/advisor/investors/{{ investor_id }}"/>
</form>
```

### SP-initiated sign-in ("Sign in with SSO")

The advisor enters their email on the StratiFi sign-in page (`https://advisors.stratifi.com/signin`) and clicks
**Sign in with SSO**. StratiFi finds your IdP from the email's domain and redirects the advisor there with a SAML
AuthnRequest. The email is passed as the requested subject, so your IdP can pre-fill the username. Once your IdP posts
the assertion back to the ACS, the advisor lands in StratiFi signed in. StratiFi turns on the **Sign in with SSO**
button during setup; the sign-in links below work either way.

Your application can also start SP-initiated sign-in with a link:

| Link                                                                                                 | Use                                                                                     |
|------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| `https://backend.stratifi.com/sso/login/?login_hint={{ base64url_email }}&next={{ path }}`           | Routes by the email's domain, like the sign-in page.                                    |
| `https://advisors.stratifi.com/sso/{{ org_slug }}/`                                                  | Goes straight to your firm's IdP, without asking for an email.                          |

`login_hint` is the advisor's email, base64url-encoded without padding. `next` is optional and follows the same rules
as [RelayState](#relaystate-deep-link). Routing by email needs the email's domain registered for your firm (see
[Multiple IdPs and email domains](#multiple-idps-and-email-domains)). An unregistered domain sends the advisor back to
the sign-in page with an SSO error.

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

## Multiple IdPs and email domains

A firm can register several IdPs, for example one per office or acquired entity. Each IdP gets its own org slug and
its own set of [SP endpoints](#service-provider-endpoints). Each IdP can have many email domains, so advisors who use
their own domains can sign in through the same IdP. Contact support@stratifi.com to have additional IdPs or email
domains configured.

Email domains are only needed for SP-initiated sign-in that routes by email. IdP-initiated sign-in works without them.
An email domain can belong to only one IdP.

## Advisor matching

- IdP-initiated SSO must be enabled for your firm (StratiFi configures this during setup).
- The SAML assertion must be **signed**.
- The assertion carries the advisor's email, either in an `emailAddress`-format **NameID** or in an `email` or
  `emailAddress` attribute. An `unspecified`-format NameID is read as the email only if StratiFi turns that on for
  your IdP during setup; otherwise send one of the other two.
- StratiFi matches that email to an active advisor, ignoring case. The match only looks at advisors of the firm the IdP
  belongs to, and must find exactly one.
- The advisor must already exist in StratiFi with a matching email.
- If an advisor's email changes, update it in StratiFi first. Until it matches, sign-in fails.

## Two-factor authentication

SSO does not bypass StratiFi two-factor authentication. If your firm enforces 2FA, an advisor with an enrolled device
completes the StratiFi 2FA challenge after your IdP signs them in. An advisor with no enrolled device is refused.
StratiFi does not read MFA information from the SAML assertion.

## Customizations

Just-in-time provisioning, SCIM, mapping roles or names from the assertion, and SSO-only enforcement are available as
customizations on demand. Contact support@stratifi.com to know more.
