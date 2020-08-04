# Investors

## Investor Object Definition

| Name      | Type                                   | Description           |
| --------- | -------------------------------------- | --------------------- |
| id        | int                                    | Investor ID           |
| advisor   | int                                    | Advisor ID            |
| household | int                                    | Household ID          |
| phone     | string                                 | Phone of the investor |
| user      | [User Object](#user-object-definition) | User info             |

> Investor Object

```shell
{
  "id": 1,
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
> curl "https://backend.stratifi.com/v1/investors/" -H "Authorization: stratifi-token"

{
  "count": 10,
  "next": "https://backend.stratifi.com/v1/investors/?page=2",
  "previous": null,
  "results": [
    {
      "id": 1,
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

## Get Investor

-request-type: GET

-request-url: `/investors/<id>/`

**Response:** The requested [investor object](#investor-object-definition).

> Get Investor

```shell
> curl "https://backend.stratifi.com/v1/investors/1/" -H "Authorization: stratifi-token"

{
  "id": 1,
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
> curl -X POST "https://backend.stratifi.com/v1/investors/" -H "Authorization: stratifi-token" \
  -d '{
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

| Parameter | Type                                   |          |
| --------- | -------------------------------------- | -------- |
| advisor   | int                                    | Required |
| household | int                                    | Optional |
| phone     | string                                 | Optional |
| user      | [User Object](#user-object-definition) | Required |

**Response:** The new [investor object](#investor-object-definition).

## Update Investor

-request-type: PUT/PATCH

-request-url: `/investors/<id>/`

**Request Parameters**

| Parameter | Type                                   |          |
| --------- | -------------------------------------- | -------- |
| advisor   | int                                    | Required |
| household | int                                    | Optional |
| phone     | string                                 | Optional |
| user      | [User Object](#user-object-definition) | Required |

> Update Investor

```shell
> curl -X PUT "https://backend.stratifi.com/v1/investors/150/" -H "Authorization: stratifi-token" \
  -d '{
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
> curl "https://backend.stratifi.com/v1/investors/11/prism_aggregation/" -H "Authorization: stratifi-token"

{
  "no_overlay_concentrated": 4.850381420050724
  "no_overlay_concentrated": 4.785445142005072,
  "no_overlay_correlation": 6.049895392953136,
  "no_overlay_overall": 8.2145327985038
  "no_overlay_volatility": 9.224755263382502
}
```

**Response Fields**

| Name                    | Type  | Description         |
| ----------------------- | ----- | ------------------- |
| no_overlay_overall      | float | Overall score       |
| no_overlay_concentrated | float | Concentration score |
| no_overlay_correlation  | float | Correlation score   |
| no_overlay_tail         | float | Tail score          |
| no_overlay_volatility   | float | Volatility score    |
