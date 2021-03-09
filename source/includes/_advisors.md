# Advisors

## Advisor Object Definition

| Name             | Type                                   | Description                                   |
| ---------------- | -------------------------------------- | --------------------------------------------- |
| id               | int                                    | Advisor ID                                    |
| external_id      | string                                 | Your advisor identifier                       |
| company          | int                                    | Company ID                                    |
| default_investor | int                                    | ID of the default investor of this advisor \* |
| phone            | string                                 | Advisor Phone                                 |
| title            | string                                 | Advisor Job Title                             |
| user             | [User Object](#user-object-definition) | User info                                     |

(\*) Sometimes the advisor owns accounts that are not attached to an investor or the investor information is not available. In these cases, you can use the advisor default investor to create link accounts to the advisor without an investor.

> Advisor Object

```shell
{
  "id": 1,
  "external_id": "adv-1",
  "company": 1,
  "default_investor": 101,
  "phone": "5555555555",
  "title": "Co-founder",
  "user": {
     "first_name":"John",
     "last_name":"Wick",
     "email":"john.wick@example.com"
  }
}
```

## List Advisors

-request-type: GET

-request-url: `/advisors/`

> List Advisors

```shell
curl "https://backend.stratifi.com/api/v1/advisors/" -H "Authorization: Bearer {{ access-token }}"

{
  "count": 10,
  "next": "https://backend.stratifi.com/api/v1/advisors/?page=2",
  "previous": null,
  "results": [
    {
      "id": 1,
      "external_id": "adv-1",
      "company": 1,
      "default_investor": 101,
      "phone": "5555555555",
      "title": "Co-founder",
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

| Name     | Type   | Description                                           |
| -------- | ------ | ----------------------------------------------------- |
| count    | int    | Total number of advisors                              |
| next     | string | Link to next page of advisors                         |
| previous | string | Link to previous page of advisors                     |
| results  | Object | List of [advisor objects](#advisor-object-definition) |

**Filtering Fields**

| Name        | Type   | Description             |
| ----------- | ------ | ----------------------- |
| company     | int    | Company ID              |
| external_id | string | Your advisor identifier |

## Get Advisor

-request-type: GET

-request-url: `/advisors/<id>/`

**Response:** The requested [advisor object](#advisor-object-definition).

> Get Advisor

```shell
curl "https://backend.stratifi.com/api/v1/advisors/1/" -H "Authorization: Bearer {{ access-token }}"

{
  "id": 1,
  "external_id": "adv-1",
  "company": 1,
  "default_investor": 101,
  "phone": "5555555555",
  "title": "Co-founder",
  "user": {
     "first_name":"John",
     "last_name":"Wick",
     "email":"john.wick@example.com"
  }
}
```

## Create Advisor

-request-type: POST

-request-url: `/advisors/`

> Create Advisor

```shell
curl -X POST "https://backend.stratifi.com/api/v1/advisors/" -H "Authorization: Bearer {{ access-token }}" \
  -d '{
    "external_id": "adv-1",
    "company": 1,
    "phone": "754-3010",
    "title": "CEO",
    "user": {
      "first_name": "Doug",
      "last_name": "Spencer",
      "email": "doug.spencer@example.com"
    }
  }'

{
  "id": 150,
  "external_id": "adv-1",
  "company": 1,
  "default_investor": 102,
  "phone": "754-3010",
  "title": "CEO",
  "user": {
    "first_name": "Doug",
    "last_name": "Spencer",
    "email": "doug.spencer@example.com"
  }
}
```

**Request Parameters**

| Parameter   | Type                                   |          |
| ----------- | -------------------------------------- | -------- |
| user        | [User Object](#user-object-definition) | Required |
| company     | int                                    | Required |
| phone       | string                                 | Optional |
| title       | string                                 | Optional |
| external_id | string                                 | Optional |

**Response:** The new [advisor object](#advisor-object-definition).

## Update Advisor

-request-type: PUT/PATCH

-request-url: `/advisors/<id>/`

**Request Parameters**

| Parameter   | Type                                   |          |
| ----------- | -------------------------------------- | -------- |
| user        | [User Object](#user-object-definition) | Required |
| company     | int                                    | Required |
| phone       | string                                 | Optional |
| title       | string                                 | Optional |
| external_id | string                                 | Optional |

> Update Advisor

```shell
curl -X PUT "https://backend.stratifi.com/api/v1/advisors/150/" -H "Authorization: Bearer {{ access-token }}" \
  -d '{
    "external_id": "adv-1",
    "title": "CEO/Founder",
    "company": 1,
    "phone": "754-3010",
    "user": {
      "first_name": "Doug",
      "last_name": "Spencer",
      "email": "dspencer@example.com"
    }
  }'

{
  "id": 150,
  "external_id": "adv-1",
  "company": 1
  "phone": "754-3010",
  "default_investor": 102,
  "title": "CEO/Founder",
  "user": {
    "first_name": "Doug",
    "last_name": "Spencer",
    "email": "dspencer@example.com"
  }
}
```

## Advisor Prism Aggregation

-request-type: GET

-request-url: `/advisors/<id>/prism_aggregation/`

> Advisor Prism Aggregation

```shell
curl "https://backend.stratifi.com/api/v1/advisors/11/prism_aggregation/" -H "Authorization: Bearer {{ access-token }}"

{
  "concentrated": 4.785445142005072,
  "correlation": 6.049895392953136,
  "overall": 8.214532798503825,
  "tail": 8.674759220001045,
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
