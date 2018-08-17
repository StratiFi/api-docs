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
      "owner": 1000,
      "name": "first house",
      "advisor": 71
    },
    {
      "id": 2,
      "owner": 1000,
      "name": "second house",
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
name | String | Household name
owner | int | ID of the user who created the object
advisor | int |  ID of the advisor


## Create Household

-request-type: POST

-request-url: /households

```shell
curl -X POST "api.stratifi.com/v1/households/"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
    "advisor": <advisor id>,
    "name": "new house"
    }'
```

> Reponse Body

```shell
{
    "id": 2,
    "name": "new house",
    "owner": 1000,
    "advisor": <advisor id>
}

```

**Request Parameters**

Parameter | Type | Description
----------|------|------------
advisor | int | ID of the Advisor object
name | String | Name of household


**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of households in StratiFi's system
name | String | Household name
owner | int | ID of the user who created the object
advisor | int | ID of the Advisor object


## Get Household By ID

Get household by ID

-request-type: GET

-request-url: /households/:ID

**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of household in StratiFi's system
name | String | Household name
owner | int | ID of the user who created the object
advisor | int | ID of the advisor


## Update Household

Update household

-request-type: PUT

-request-url: /households/:ID


**Request Parameters**

Parameter | Type | Description
----------|------|------------
advisor | int | ID of the advisor
name | String | Household name


**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of households in StratiFi's system
name | String | Household name
owner | int | ID of the user who created the object
advisor | int | ID of the Advisor object


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
    "no_overlay_concentrated": 4.205588959868668,
    "no_overlay_correlation": 4.999999999999999,
    "no_overlay_overall": 5.1045410298932925,
    "no_overlay_tail": 5.804890339885084,
    "no_overlay_volatility": 4.205588959868668
}
```

**Response Fields**

Name | Type | Description
-----|------|------------
no_overlay_concentrated | float | The value of the concentration
no_overlay_correlation | float | The value of the correlation
no_overlay_overall | float | Overall value
no_overlay_volatility | float | The value of the volatility
