# Authentication

> To authorize, use this code:

```ruby
require 'prism'

api = Prism::APIClient.authorize!('stratifi-token')
```

```python
import prism

api = prism.authorize('stratifi-token')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: stratifi-token"
```

```javascript
const prism = require('prism');

let api = prism.authorize('stratifi-token');
```

> Make sure to replace `stratifi-token` with your API key.

StratiFi's PRISM API uses API keys to allow access to the API. You can register a new API key at our [developer portal](http://example.com/developers).

StratiFi expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: stratifi-token`

<aside class="notice">
You must replace <code>stratifi-token</code> with your personal API key.
</aside>
