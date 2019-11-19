# Model Portfolios

All model portfolios related endpoints

## Model Portfolio Object

Name | Type | Description
-----|------|------------
id | int | ID of Model Portfolio in StratiFi's system
name |string | Model Portfolio name
value |string | Model Portfolio value
type |string | Model Portfolio type
company |int | ID of Company object in StratiFi's system
positions | Array | Positions array

`position` Object

Name | Type | Description
-----|------|------------
ticker |string | Ticker label
ticker_name |string | Ticker description
value |string | Weight of the position in percentage.

> Model Portfolio Object Description:

```shell
{
  "id": 1,
  "name": "Aggresive 60/40",
  "value": "100.0",
  "type": "100",
  "company": 1,
  "positions": [
    {
      "ticker": "SPY",
      "ticker_name": "SPDR S&P 500",
      "value": "60"
    },
    {
      "ticker": "IBM",
      "ticker_name": "IBM",
      "value": "40"
    },
    …
  ]
}

```

## List Model Portfolios

-request-type: GET

-request-url: /models

> To Get all the Model Portfolios, use this code:

```shell
curl "https://backend.stratifi.com/v1/models/"
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
count | int | Number of model portfolios
next | String | Link to next page of model portfolios
previous | String | Link to previous page of model portfolios
results | Object | List of Model Portfolio objects


## Create Model Portfolio

-request-type: POST

-request-url: /models

> To Create an Model Portfolio, use this code:

```shell
curl -X POST "api.stratifi.com/v1/models/"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{ … }'
```

**Request Parameters**

The Model Portfolio object to be created (without ID). Only the mode portfolio name is required.

If the list of `positions` is included, the mode portfolio value will be the Sum of the position's values.


**Response Fields**

The Model Portfolio object with a valid mode portfolio ID.


## Get Model Portfolio By ID

Get mode portfolio by ID

-request-type: GET

-request-url: /models/:ID


**Response Fields**

Returns the mode portfolio object.

> To Get an Model Portfolio by ID, use this code:

```shell
curl "https://backend.stratifi.com/v1/models/1/"
  -H "Authorization: stratifi-token"
```


## Update Model Portfolio

Update the mode portfolio information.

-request-type: PUT/PATCH

-request-url: /models/:ID


**Request Parameters**

You can use a `PUT` request and send an entire mode portfolio object, or a `PATCH` request and send only the fields you want to update.

Notice that the if the `positions` field in included, the existing positions of the mode portfolio will be replaced.


**Response Fields**

Returns the mode portfolio object.

> To Update an Model Portfolio, use this code:

```shell
curl -X PUT "api.stratifi.com/v1/models/"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{ … }'
```

## Model Portfolio Prism Score

-request-type: GET

-request-url: /models/:ID/prism_score

> To get the Model Portfolio Prism Score, use this code:

```shell
curl "https://backend.stratifi.com/v1/models/:ID/prism_score"
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
