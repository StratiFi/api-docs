# Accounts

All accounts related endpoints

## Account Object

Name | Type | Description
-----|------|------------
id | int | ID of Account in StratiFi's system
name |string | Account name
value |string | Account value
type |string | Account type
number |string | Account number
investor |int | ID of Investor object in StratiFi's system
positions | Array | Positions array

`position` Object

Name | Type | Description
-----|------|------------
ticker |string | Ticker label
ticker_name |string | Ticker description
value |string | Value

> Account Object Description:

```shell
{
  "id": 1,
  "name": "John Doe Trust",
  "value": "1234567.89",
  "type": "100",
  "number": "987654321",
  "investor": 1,
  "positions": [
    {
      "ticker": "SPY",
      "ticker_name": "SPDR S&P 500",
      "value": "823045.26"
    },
    {
      "ticker": "IBM",
      "ticker_name": "IBM",
      "value": "411522.63"
    },
    …
  ]
}

```

**Valid Account Types**

Value | Description
----------|------
100 | Individual
101 | Joint
200 | Revocable Living Trust
201 | Irrevocable Living Trust
300 | Limited Liability Company
304 | Limited Liability Limited Partnership
301 | S Corporation
302 | C Corporation
303 | Sole Proprietorship
400 | Traditional IRA
402 | Simplified Employee Pension IRA
402 | Savings Incentive Match Plan for Employees IRA
403 | Roth IRA
404 | Rollover IRA
500 | Household Account


## Get All Accounts

-request-type: GET

-request-url: /accounts

> To Get all the Accounts, use this code:

```shell
curl "api.stratifi.com/v1/accounts/"
  -H "Authorization: stratifi-token"
```

> Reponse Body:

```shell
{
  "count": 10,
  "next": null,
  "previous": null,
  "results": [ … ]
}
```

**Response Fields**

Name | Type | Description
-----|------|------------
count | int | Number of accounts
next | String | Link to next page of accounts
previous | String | Link to previous page of accounts
results | Object | List of Account objects


## Create Account

-request-type: POST

-request-url: /accounts

> To Create an Account, use this code:

```shell
curl -X POST "api.stratifi.com/v1/accounts/"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{ … }'
```

**Request Parameters**

The Account object to be created (without ID). Only the account name is required.

If the list of `positions` is included, the account value will be the Sum of the position's values.


**Response Fields**

The Account object with a valid account ID.


## Get Account By ID

Get account by ID

-request-type: GET

-request-url: /accounts/:ID


**Response Fields**

Returns the account object.

> To Get an Account by ID, use this code:

```shell
curl "api.stratifi.com/v1/accounts/1/"
  -H "Authorization: stratifi-token"
```


## Update Account

Update the account information.

-request-type: PUT/PATCH

-request-url: /accounts/:ID


**Request Parameters**

You can use a `PUT` request and send an entire account object, or a `PATCH` request and send only the fields you want to update.

Notice that the if the `positions` field in included, the existing positions of the account will be replaced.


**Response Fields**

Returns the account object.

> To Update an Account, use this code:

```shell
curl -X PUT "api.stratifi.com/v1/accounts/"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{ … }'
```

## Account Prism Score

-request-type: GET

-request-url: /accounts/:ID/prism_score

> To get the Account Prism Score, use this code:

```shell
curl "api.stratifi.com/v1/accounts/:ID/prism_score"
  -H "Authorization: stratifi-token"
```

> Reponse Body:

```shell
{
  "no_overlay_concentrated": 4.785445142005072,
  "no_overlay_correlation": 6.049895392953136,
  "no_overlay_overall": 8.214532798503825,
  "no_overlay_tail": 8.674759220001045,
  "no_overlay_volatility": 9.224755263382502
}
```

**Response Fields**

Name | Type | Description
-----|------|------------
no_overlay_overall | float | Overall score
no_overlay_concentrated | float | Concentration score
no_overlay_correlation | float | Correlation score
no_overlay_tail | float | Tail score
no_overlay_volatility | float | Volatility score
