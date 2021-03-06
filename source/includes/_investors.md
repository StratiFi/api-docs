# Investors

## Investor Object Definition

| Name        | Type                                   | Description                                         |
| ----------- | -------------------------------------- | --------------------------------------------------- |
| id          | int                                    | Investor ID                                         |
| external_id | string                                 | Your investor identifier                            |
| advisor     | int                                    | Advisor ID                                          |
| household   | int                                    | Household ID                                        |
| is_prospect | bool                                   | Indicates if the investor is a client or a prospect |
| phone       | string                                 | Phone of the investor                               |
| user        | [User Object](#user-object-definition) | User info                                           |

> Investor Object

```shell
{
  "id": 1,
  "external_id": "inv-1",
  "advisor": 1,
  "household": 1,
  "phone": "5555555555",
  "user": {
     "first_name":"John",
     "last_name":"Wick",
     "email":"john.wick@example.com"
  }
}
```

## List Investors

-request-type: GET

-request-url: `/investors/`

> List Investors

```shell
curl "https://backend.stratifi.com/api/v1/investors/" -H "Authorization: Bearer {{ access-token }}"

{
  "count": 10,
  "next": "https://backend.stratifi.com/api/v1/investors/?page=2",
  "previous": null,
  "results": [
    {
      "id": 1,
      "external_id": "inv-1",
      "advisor": 1,
      "household": 1,
      "phone": "5555555555",
      "user": {
         "first_name":"John",
         "last_name":"Wick",
         "email":"john.wick@example.com"
      }
    },
    …
  ]
}
```

**Response Fields**

| Name     | Type   | Description                                             |
| -------- | ------ | ------------------------------------------------------- |
| count    | int    | Total number of investors                               |
| next     | string | Link to next page of investors                          |
| previous | string | Link to previous page of investors                      |
| results  | Object | List of [investor objects](#investor-object-definition) |

**Filtering Fields**

| Name        | Type   | Description              |
| ----------- | ------ | ------------------------ |
| advisor     | int    | Advisor ID               |
| household   | int    | Household ID             |
| external_id | string | Your investor identifier |

## Get Investor

-request-type: GET

-request-url: `/investors/<id>/`

**Response:** The requested [investor object](#investor-object-definition).

> Get Investor

```shell
curl "https://backend.stratifi.com/api/v1/investors/1/" -H "Authorization: Bearer {{ access-token }}"

{
  "id": 1,
  "external_id": "inv-1",
  "advisor": 1,
  "household": 1,
  "phone": "5555555555",
  "user": {
     "first_name":"John",
     "last_name":"Wick",
     "email":"john.wick@example.com"
  }
}
```

## Create Investor

-request-type: POST

-request-url: `/investors/`

> Create Investor

```shell
curl -X POST "https://backend.stratifi.com/api/v1/investors/" -H "Authorization: Bearer {{ access-token }}" \
  -d '{
    "external_id": "inv-1",
    "advisor": 1,
    "household": 1,
    "phone": "754-3010",
    "user": {
      "first_name": "Brian",
      "last_name": "May",
      "email": "brian.may@example.com"
    }
  }'

{
  "id": 150,
  "external_id": "inv-1",
  "advisor": 1,
  "household": 1,
  "phone": "754-3010",
  "user": {
    "first_name": "Brian",
    "last_name": "May",
    "email": "brian.may@example.com"
  }
}
```

**Request Parameters**

| Parameter   | Type                                   |          |
| ----------- | -------------------------------------- | -------- |
| user        | [User Object](#user-object-definition) | Required |
| advisor     | int                                    | Required |
| household   | int                                    | Optional |
| phone       | string                                 | Optional |
| external_id | string                                 | Optional |

**Response:** The new [investor object](#investor-object-definition).

## Update Investor

-request-type: PUT/PATCH

-request-url: `/investors/<id>/`

**Request Parameters**

| Parameter   | Type                                   |          |
| ----------- | -------------------------------------- | -------- |
| user        | [User Object](#user-object-definition) | Required |
| advisor     | int                                    | Required |
| household   | int                                    | Optional |
| phone       | string                                 | Optional |
| external_id | string                                 | Optional |

> Update Investor

```shell
curl -X PUT "https://backend.stratifi.com/api/v1/investors/150/" -H "Authorization: Bearer {{ access-token }}" \
  -d '{
    "external_id": "inv-1",
    "advisor": 1,
    "household": 1,
    "phone": "754-3010",
    "user": {
      "first_name": "Brian",
      "last_name": "May",
      "email": "b.may@example.com"
    }
  }'

{
  "id": 150,
  "external_id": "inv-1",
  "advisor": 1
  "phone": "754-3010",
  "user": {
    "first_name": "Brian",
    "advisor "May",
    "last_name": "May",
    "email": "b.may@example.com"
  }
}

```

## Investor Prism Aggregation

-request-type: GET

-request-url: `/investors/<id>/prism_aggregation/`

> Investor Prism Aggregation

```shell
curl "https://backend.stratifi.com/api/v1/investors/11/prism_aggregation/" -H "Authorization: Bearer {{ access-token }}"

{
  "concentrated": 4.850381420050724
  "concentrated": 4.785445142005072,
  "correlation": 6.049895392953136,
  "overall": 8.2145327985038
  "volatility": 9.224755263382502
}
```

**Response Fields**

| Name         | Type  | Description         |
| ------------ | ----- | ------------------- |
| overall      | float | Overall score       |
| concentrated | float | Concentration score |
| correlation  | float | Correlation score   |
| tail         | float | Tail score          |
| volatility   | float | Volatility score    |
