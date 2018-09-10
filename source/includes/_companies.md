# Companies

All companies related endpoints


## Get All Companies

-request-type: GET

-request-url: /companies

> To send request:

```shell
curl "api.stratifi.com/v1/companies/"
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
            "name": "Companny A, LLC"
        },
        {
            "id": 2,
            "name": "Companny B, LLC"
        }
    ]
}
```

**Response Fields**

Name | Type | Description
-----|------|------------
count | int | Number of companies
next | String | Link to next page of companies
previous | String | Link to previous page of companies
results | Object | List of Company objects

`results` Object

Name | Type | Description
-----|------|------------
id | int | ID of company in StratiFi's system
name | String | Name of company


## Create Company

-request-type: POST

-request-url: /companies

```shell
curl -X POST "api.stratifi.com/v1/companies/"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
    "name": "Company C, LLC",
  }'
```

> Reponse Body

```shell
{
  "id": 3,
  "name": "Companny C, LLC"
}

```

**Request Parameters**

Parameter | Type | Description
----------|------|------------
name | String | Name of company


**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of company in StratiFi's system
name | String | Name of company


## Get Company By ID

Get company by ID

-request-type: GET

-request-url: /companies/:ID


**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of company in StratiFi's system
name | String | Name of company

## Update Company

Update company household

-request-type: PUT/PATCH

-request-url: /companies/:ID


**Request Parameters**

Parameter | Type | Description
----------|------|------------
name | String | Name of company


## Company Prism Aggregation

-request-type: GET

-request-url: /companies/:ID/prism_aggregation

> To send request:

```shell
curl "api.stratifi.com/v1/companies/<company id>/prism_aggregation"
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
