# Advisors

## Advisor Object Definition

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
  },
  "risk": {
    "scores": {…},
    "media": {…}
  },
  "tolerance": {
    "scores": {…},
    "media": {…}
  },
  "drift": 5.1
}
```

| Name             | Type                                   | Description                                   |
| ---------------- | -------------------------------------- | --------------------------------------------- |
| id               | int                                    | Advisor ID                                    |
| external_id      | string                                 | Your advisor identifier                       |
| company          | int                                    | Company ID                                    |
| default_investor | int                                    | ID of the default investor of this advisor \* |
| phone            | string                                 | Advisor Phone                                 |
| title            | string                                 | Advisor Job Title                             |
| user             | [User Object](#user-object-definition) | User info                                     |
| risk.scores      | [Scores Factors](#scores-factors)      | Advisor aggregated risk scores                |
| risk.media       | [Scores Media](#scores-media)          | Advisor aggregated risk scores images         |
| tolerance.scores | [Scores Factors](#scores-factors)      | Advisor aggregated tolerance scores           |
| tolerance.media  | [Scores Media](#scores-factors)        | Advisor aggregated tolerance scores images    |
| drift            | float                                  | Advisor drift score                           |

(\*) Sometimes the advisor owns accounts that are not attached to an investor or the investor information is not available. In these cases, you can use the advisor default investor to create link accounts to the advisor without an investor.

## List Advisors

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
      },
      "risk": {…},
      "tolerance": {…},
      "drift": 5.1
    },
    …
  ]
}
```

-request-type: GET

-request-url: `/advisors/`

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
  },
  "risk": {…},
  "tolerance": {…},
  "drift": 5.1
}
```

-request-type: GET

-request-url: `/advisors/<id>/`

**Response:** The requested [advisor object](#advisor-object-definition).

## Create Advisor

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
  },
  "risk": {…},
  "tolerance": {…},
  "drift": 5.1
}
```

-request-type: POST

-request-url: `/advisors/`

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
  },
  "risk": {…},
  "tolerance": {…},
  "drift": 5.1
}
```

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

## Advisor Prism Aggregation

> Advisor Prism Aggregation

```shell
curl "https://backend.stratifi.com/api/v1/advisors/11/prism_aggregation/" -H "Authorization: Bearer {{ access-token }}"

{
  "scores": {…},
  "media": {…}
}
```

-request-type: GET

-request-url: `/advisors/<id>/prism_aggregation/`

**Response Fields**

| Name   | Type                              | Description               |
| ------ | --------------------------------- | ------------------------- |
| scores | [Scores Factors](#scores-factors) | Risk score factors        |
| media  | [Scores Images](#scores-media)    | Risk score factors images |
| status | [Scores Status](#scores-status)   | Risk score status         |
