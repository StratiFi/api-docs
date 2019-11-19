# Advisors

All advisors related endpoints


## List Advisors

-request-type: GET

-request-url: /advisors

> To send request:

```shell
curl "https://backend.stratifi.com/v1/advisors/"
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
        "title": "Co-founder",
        "company": 1,
        "phone": "5555555555",
        "default_investor": 101
    },
    {
        "id": 2,
        "user": {
           "first_name":"Mike",
           "last_name":"Spencer",
           "email":"mspencer@example.com"
        },
        "company": 1,
        "title": "Mr.",
        "phone": "5555555555",
        "default_investor": 102
    }, … ]
  ]
}
```

**Response Fields**

Name | Type | Description
-----|------|------------
count | int | Number of advisors
next | String | Link to next page of advisors
previous | String | Link to previous page of advisors
results | Object | List of Advisor objects

`results` Object

Name | Type | Description
-----|------|------------
id | int | ID of advisor in StratiFi's system
company |int | ID of Company object in StratiFi's system
phone |string | Phone of the advisor
title |string | Title of the advisor
user | Object | User object
default_investor | int | ID of the default investor of this advisor. You can use it to create accounts if you don't have the investor information.


## Create Advisor

-request-type: POST

-request-url: /advisors

```shell
curl -X POST "api.stratifi.com/v1/advisors/"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
    "title": <household id>,
    "company": <advisor id>,
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
  "default_investor": 101,
  "user": {
    "first_name": "Mike",
    "last_name": "Spencer",
    "email": "mspencer@example.com"
  },
  "title": 200,
  "company": 101
}

```

**Request Parameters**

Parameter | Type | Description
----------|------|------------
company | int | ID of Company object in StratiFi's system
title | string | Title of the advisor
user | Object | User data


`user` Object

Name | Type | Description
-----|------|------------
email | String | Advisor email
first_name | String | Advisor first name
last_name | String | Advisor last name


**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of advisor in StratiFi's system
company |int | ID of Company object in StratiFi's system
phone |string | Phone of the advisor
title |string | Title of the advisor
user | Object | User object


## Get Advisor By ID

Get advisor by ID

-request-type: GET

-request-url: /advisors/:ID


**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of advisor in StratiFi's system
company |int | ID of Company object in StratiFi's system
phone |string | Phone of the advisor
title |string | Title of the advisor
user | Object | User object


## Update Advisor

Update advisor information

-request-type: PUT/PATCH

-request-url: /advisors/:ID


**Request Parameters**

Parameter | Type | Description
----------|------|------------
company |int | ID of Company object in StratiFi's system
phone |string | Phone of the advisor
title | string | Title of the advisor
user | Object | User object

`user` Object

Name | Type | Description
-----|------|------------
email | String | Advisor email
first_name | String | Advisor first name
last_name | String | Advisor last name


**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of advisor in StratiFi's system
company | int | ID of Company object in StratiFi's system
phone | string | Phone of the advisor
title | string | title of the advisor
user | Object | User object


## Advisor Prism Aggregation

-request-type: GET

-request-url: /advisors/:ID/prism_aggregation

> To send request:

```shell
curl "https://backend.stratifi.com/v1/advisors/<advisor id>/prism_aggregation"
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
