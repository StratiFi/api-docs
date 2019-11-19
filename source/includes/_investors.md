# Investors

All investors related endpoints


## Get All Investors

-request-type: GET

-request-url: /investors

> To send request:

```shell
curl "https://backend.stratifi.com/v1/investors/"
  -H "Authorization: stratifi-token"
```

> Reponse Body

```shell
{
  "count": 10,
  "next": null,
  "previous": null,
  "results": [
    {
        "id": 1,
        "user": {
           "first_name":"John",
           "last_name":"Wick",
           "email":"john.wick@example.com"
        },
        "advisor": 1,
        "household": 1,
        "phone": "5555555555"
    },
    {
        "id": 2,
        "user": {
           "first_name":"Mike",
           "last_name":"Spencer",
           "email":"mspencer@example.com"
        },
        "advisor": 1,
        "household": 2,
        "phone": "5555555555"
    }, … ]
  ]
}
```

**Response Fields**

Name | Type | Description
-----|------|------------
count | int | Number of investors
next | String | Link to next page of investors
previous | String | Link to previous page of investors
results | Object | List of Investor objects

`results` Object

Name | Type | Description
-----|------|------------
id | int | ID of investor in StratiFi's system
advisor |int | ID of Advisor object in StratiFi's system
household |int | ID of Household object in StratiFi's system
phone |string | Phone of the investor
user | Object | User object


## Create Investor

-request-type: POST

-request-url: /investors

```shell
curl -X POST "api.stratifi.com/v1/investors/"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
    "household": <household id>,
    "advisor": <advisor id>,
    "phone": "5555555555",
    "user": {
      "first_name": "John",
      "last_name": "Wick",
      "email": "john.wick@example.com"
      }
    }'
```

> Reponse Body

```shell
{
  "id": 150,
  "phone": "754-3010",
  "user": {
    "first_name": "Mike",
    "last_name": "Spencer",
    "email": "mspencer@example.com"
  },
  "household": 200,
  "advisor": 101
}

```

**Request Parameters**

Parameter | Type | Description
----------|------|------------
advisor | int | ID of Advisor object in StratiFi's system
household | int | (optional) ID of Household object in StratiFi's system
user | Object | User data


`user` Object

Name | Type | Description
-----|------|------------
email | String | Investor email
first_name | String | Investor first name
last_name | String | Investor last name


**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of investor in StratiFi's system
advisor |int | ID of Advisor object in StratiFi's system
household |int | ID of Household object in StratiFi's system
phone |string | Phone of the investor
user | Object | User object


## Get Investor By ID

Get investor by ID

-request-type: GET

-request-url: /investors/:ID


**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of investor in StratiFi's system
advisor |int | ID of Advisor object in StratiFi's system
household |int | ID of Household object in StratiFi's system
phone |string | Phone of the investor
user | Object | User object


## Update Investor

Update investor information

-request-type: PUT/PATCH

-request-url: /investors/:ID


**Request Parameters**

Parameter | Type | Description
----------|------|------------
advisor |int | ID of Advisor object in StratiFi's system
household | int | (optional) ID of Household object in StratiFi's system
phone |string | Phone of the investor
user | Object | User object

`user` Object

Name | Type | Description
-----|------|------------
email | String | Investor email
first_name | String | Investor first name
last_name | String | Investor last name


**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of investor in StratiFi's system
advisor | int | ID of Advisor object in StratiFi's system
household | int | ID of Household object in StratiFi's system
phone | string | Phone of the investor
user | Object | User object


## Investor Prism Aggregation

-request-type: GET

-request-url: /investors/:ID/prism_aggregation

> To send request:

```shell
curl "https://backend.stratifi.com/v1/investors/<investor id>/prism_aggregation"
  -H "Authorization: stratifi-token"
```

> Reponse Body

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
