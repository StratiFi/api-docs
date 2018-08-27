# Investors

All investors related endpoints


## Get All Investors

-request-type: GET

-request-url: /investors

> To send request:

```shell
curl "api.stratifi.com/v1/investors/"
  -H "Authorization: stratifi-token"
```

> Reponse Body

```shell
{
  "count": 100,
  "next": null,
  "previous": null,
  "results": [
    {
        "id": 4321,
        "accounts": []
        "user": {
           "id":100,
           "username":"username",
           "first_name":"John",
           "last_name":"Wick",
           "email":"john.wick@example.com",
           "is_active":true,
           "date_joined":"2018-03-12T09:34:09.988563",
           "groups":[]
        },
        "household": null,
        "updated_at": "2018-06-04T11:00:08.859179",
        "created_at": "2018-06-04T11:00:08.859212",
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
accounts | Object | List of accounts
user | Object | User object
household |int | ID of Household object
updated_at | Timestamp | Last updated timestamp
created_at | Timestamp | Created at timestamp


## Create Investor

-request-type: POST

-request-url: /investors

```shell
curl -X POST "api.stratifi.com/v1/investors/"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
    "household": <household id>,
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
  "image": 'image/path',
  "data": null,
  "updated_at": "2018-06-13T13:36:26.927660",
  "created_at": "2018-06-13T13:36:26.927680",
  "status": 1,
  "user": 100,
  "household": 200,
  "advisor": 101,
  "owner": 201,
  "address": 1000
}

```

**Request Parameters**

Parameter | Type | Description
----------|------|------------
user | Object | User data
household | int | (optional) ID of Household object


`user` Object

Name | Type | Description
-----|------|------------
first_name | String | Investor first name
last_name | String | Investor last name
email | String | Investor email

**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of investor in StratiFi's system
phone | String | Investor phone number
image | String | Investor image
data | Object | Object describing the payload
status | int | ID of investor status
user | int |  ID of the user object
advisor | int |  ID of the advisor
owner | int | ID of the user who created the object
address | String | Investor address
household |int | ID of Household object
updated_at | Timestamp | Last updated timestamp
created_at | Timestamp | Created at timestamp


## Get Investor By ID

Get investor by ID

-request-type: GET

-request-url: /investors/:ID


**Response Fields**

Name | Type | Description
-----|------|------------
id | int | ID of investor in StratiFi's system
accounts | Object | List of accounts
user | Object | User object
household |int | ID of Household object
updated_at | Timestamp | Last updated timestamp
created_at | Timestamp | Created at timestamp


## Update Investor

Update investor household

-request-type: PUT

-request-url: /investors/:ID


**Request Parameters**

Parameter | Type | Description
----------|------|------------
household | int | ID of Household object


## Investor Prism Aggregation

-request-type: GET

-request-url: /investors/:ID/prism_aggregation

> To send request:

```shell
curl "api.stratifi.com/v1/investors/<investor id>/prism_aggregation"
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
no_overlay_concentrated | float | The value of the concentration
no_overlay_correlation | float | The value of the correlation
no_overlay_overall | float | Overall value
no_overlay_volatility | float | The value of the volatility
