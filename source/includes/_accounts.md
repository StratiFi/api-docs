# Accounts

> Create new account:


```python

Endpoint:
api.stratifi.com/v1/accounts/

Method and Payload:
POST:    
{
"name": "New Account One",
}

Return object:

{
    "id": 13280,
    "provider": 0,
    "name": "New Account One",
    "value": 0,
    "data": null,
    "non_taxable": false,
    "portfolio_margin": false,
    "status": 1,
    "updated_at": "2018-06-13T15:11:38.520870",
    "created_at": "2018-06-13T15:11:38.520944",
    "type": null,
    "doc_type": null,
    "number": null,
    "performance_validated": false,
    "pending_overlay_changes": false,
    "investor": null,
    "advisor_account": null,
    "owner": 3591,
    "execution_client": null,
    "strategies": []
}


Endpoint:
api.stratifi.com/v1/accounts/:ID

Method:
GET:

Return object:

{
    "id": 13280,
    "provider": 0,
    "name": "New Account One",
    "value": 0,
    "data": null,
    "non_taxable": false,
    "portfolio_margin": false,
    "status": 1,
    "updated_at": "2018-06-13T15:11:38.520870",
    "created_at": "2018-06-13T15:11:38.520944",
    "type": null,
    "doc_type": null,
    "number": null,
    "performance_validated": false,
    "pending_overlay_changes": false,
    "investor": null,
    "advisor_account": null,
    "owner": 3591,
    "execution_client": null,
    "strategies": []
}


Endpoint:
api.stratifi.com/v1/accounts/:ID

Method and Payload:
PUT:

{
    "name": "testing account post 8",
    "positions": [
     {
        "value": 1000,
        "ticker": "CUR:US",
        "ticker_name": "U S Dollar"
    },
    {
        "value": 10000,
        "ticker": "SPY",
        "ticker_name": "SPDR S&P 500"
    },
    {
        "value": 10000,
        "ticker": "IVV",
        "ticker_name": "iShares Core S&P 500"
    }
    ]
}


Return object:

{
    "name": "testing account post 8",
    "positions": [
     {
        "value": 1000,
        "ticker": "CUR:US",
        "ticker_name": "U S Dollar"
    },
    {
        "value": 10000,
        "ticker": "SPY",
        "ticker_name": "SPDR S&P 500"
    },
    {
        "value": 10000,
        "ticker": "IVV",
        "ticker_name": "iShares Core S&P 500"
    }
    ]
}



```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
```

> Make sure to replace `meowmeowmeow` with your API key.

Account endpoint allows creating new account and update it with positions.<br/> 

Create account is done using POST method to https://api.stratifi.com/v1/accounts/<br/>

After adding the account GET method can be used to return details of the account using method GET to https://api.stratifi.com/v1/accounts/:id


Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

#`Authorization: meowmeowmeow`

#<aside class="notice">
#You must replace <code>meowmeowmeow</code> with your personal API key.
#</aside>
