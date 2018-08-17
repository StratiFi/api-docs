# Household

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
count | int | Number of investors
next | String | Link to next page of investors
previous | String | Link to previous page of investors
results | Object | List of Investor objects

`results` Object

Name | Type | Description
-----|------|------------
id | int | ID of household in StratiFi's system
name | String | Household name
owner | int | ID of the user who created the object
advisor | int |  ID of the advisor


## Create Household

-request-type: POST

-request-url: /investors

```shell
curl -X POST "api.stratifi.com/v1/household/"
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
id | int | ID of investor in StratiFi's system
name | String | Household name
owner | int | ID of the user who created the object
advisor | int | ID of the Advisor object


## Get Household By ID

Get household by ID

-request-type: GET

-request-url: /household/:ID

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

-request-url: /household/:ID


**Request Parameters**

Parameter | Type | Description
----------|------|------------
advisor | int | ID of the advisor
name | String | Household name


**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of investor in StratiFi's system
name | String | Household name
owner | int | ID of the user who created the object
advisor | int | ID of the Advisor object
