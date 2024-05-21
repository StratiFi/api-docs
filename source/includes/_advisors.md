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
  }
}
```

| Name             | Type                                   | Description                                   |
|------------------|----------------------------------------|-----------------------------------------------|
| id               | int                                    | Advisor ID                                    |
| external_id      | string                                 | Your advisor identifier                       |
| company          | int                                    | Company ID                                    |
| default_investor | int                                    | ID of the default investor of this advisor \* |
| phone            | string                                 | Advisor Phone                                 |
| title            | string                                 | Advisor Job Title                             |
| user             | [User Object](#user-object-definition) | User info                                     |

(\*) Sometimes the advisor owns accounts that are not attached to an investor or the investor information is not
available. In these cases, you can use the advisor default investor to create link accounts to the advisor without an
investor.

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
      }
    },
    …
  ]
}
```

-request-type: GET

-request-url: `/advisors/`

**Response Fields**

| Name     | Type   | Description                                           |
|----------|--------|-------------------------------------------------------|
| count    | int    | Total number of advisors                              |
| next     | string | Link to next page of advisors                         |
| previous | string | Link to previous page of advisors                     |
| results  | Object | List of [advisor objects](#advisor-object-definition) |

**Filtering Fields**

| Name        | Type   | Description             |
|-------------|--------|-------------------------|
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
  }
}
```

-request-type: POST

-request-url: `/advisors/`

**Request Parameters**

| Parameter   | Type                                   |          |
|-------------|----------------------------------------|----------|
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
  }
}
```

-request-type: PUT/PATCH

-request-url: `/advisors/<id>/`

**Request Parameters**

| Parameter   | Type                                   |          |
|-------------|----------------------------------------|----------|
| user        | [User Object](#user-object-definition) | Required |
| company     | int                                    | Required |
| phone       | string                                 | Optional |
| title       | string                                 | Optional |
| external_id | string                                 | Optional |

## Advisor Stats

> Individual Advisor Stats

```shell
curl "https://backend.stratifi.com/api/v1/advisors/11/stats/" -H "Authorization: Bearer {{ access-token }}"

{
    "risk": {
        "scores": {
            "overall": …
        },
        "media": {
            "overall": { … }
        }
    },
    "tolerance": {
        "scores": {
            "overall": …
        },
        "media": {
            "overall": { … }
        }
    },
    "drift": …
}
```

> All Advisors Stats

```shell
curl "https://backend.stratifi.com/api/v1/advisors/stats/" -H "Authorization: Bearer {{ access-token }}"

{
  "10": {
      "risk": {
          "scores": {
              "overall": …
          },
          "media": {
              "overall": { … }
          }
      },
      "tolerance": {
          "scores": {
              "overall": …
          },
          "media": {
              "overall": { … }
          }
      },
      "drift": …
  },
  <advisor_id>: { … },
  …
}
```

-request-type: GET

-request-url: `/advisors/stats/`

-request-url: `/advisors/<id>/stats/`

**Response Fields**

| Name                     | Type                            | Description                     |
|--------------------------|---------------------------------|---------------------------------|
| risk.scores.overall      | float                           | Advisor risk score overall      |
| risk.media.overall       | [Scores Media](#scores-media)   | Advisor risk score images       |
| tolerance.scores.overall | float                           | Advisor tolerance score overall |
| tolerance.media.overall  | [Scores Media](#scores-factors) | Advisor tolerance score images  |
| drift                    | float                           | Advisor drift score             |
