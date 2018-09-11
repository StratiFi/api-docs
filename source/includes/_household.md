# Households

All household related endpoints


## Get All Households

-request-type: GET

-request-url: /households

> To send request:

```shell
curl "api.stratifi.com/v1/households/"
  -H "Authorization: stratifi-token"
```

> Reponse Body

```shell
{
  "count": 2,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": 1,
      "name": "Household A",
      "advisor": 71
    },
    {
      "id": 2,
      "name": "Household B",
      "advisor": 71
    }
  ]
}

```

**Response Fields**

Name | Type | Description
-----|------|------------
count | int | Number of households
next | String | Link to next page of households
previous | String | Link to previous page of households
results | Object | List of household objects

`results` Object

Name | Type | Description
-----|------|------------
id | int | ID of household in StratiFi's system
advisor | int |  ID of the advisor
name | String | Household name


## Create Household

-request-type: POST

-request-url: /households

```shell
curl -X POST "api.stratifi.com/v1/households/"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
    "name": "Household C"
    "advisor": <advisor id>,
    }'
```

> Reponse Body

```shell
{
    "id": 2,
    "name": "Household C",
    "advisor": <advisor id>
}

```

**Request Parameters**

Parameter | Type | Description
----------|------|------------
advisor | int | ID of the Advisor object that owns this Household
name | String | Name of the household


**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of households in StratiFi's system
advisor | int | ID of the Advisor object that owns this Household
name | String | Household name


## Get Household By ID

Get household by ID

-request-type: GET

-request-url: /households/:ID

**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of household in StratiFi's system
advisor | int | ID of the Advisor object that owns this Household
name | String | Household name


## Update Household

Update household

-request-type: PUT/PATCH

-request-url: /households/:ID


**Request Parameters**

Parameter | Type | Description
----------|------|------------
advisor | int | ID of the Advisor object that owns this Household
name | String | Household name


**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of households in StratiFi's system
advisor | int | ID of the Advisor object that owns this Household
name | String | Household name


## Household Prism Aggregation

-request-type: GET

-request-url: /households/:ID/prism_aggregation

> To send request:

```shell
curl "api.stratifi.com/v1/households/<household id>/prism_aggregation"
  -H "Authorization: stratifi-token"
```

> Reponse Body

```shell
{
    "no_overlay_overall": 5.1045410298932925,
    "no_overlay_concentrated": 4.205588959868668,
    "no_overlay_correlation": 4.999999999999999,
    "no_overlay_tail": 5.804890339885084,
    "no_overlay_volatility": 4.205588959868668
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
