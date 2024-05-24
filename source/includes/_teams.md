# Teams

## TeamMembership object definition

> Request TeamMembership

```shell
{
    "advisor": 1,
    "is_primary": true|false
}
```

| Parameter  | Type | Description                                                                 |
|------------|------|-----------------------------------------------------------------------------|
| advisor    | int  | Advisor id                                                                  |
| is_primary | bool | Boolean value indicating if the advisor is the primary advisor for the team |

> Response TeamMembership

```shell
{
    "advisor": {
        "id": 1,
        "user": {
            "id": 1,
            "first_name": "First",
            "last_name": "Last",
            "email": "first_last@stratifi.com"
        },
        "company": 1,
        "title": "",
        "phone": "+11111111111",
        "default_investor": 2,
        "external_id": ""
    },
    "is_primary": true|false
}
```

| Name       | Type   | Description                                                                 |
|------------|--------|-----------------------------------------------------------------------------|
| advisor    | object | [Advisor object](#advisor-object-definition)                                |
| is_primary | bool   | Boolean value indicating if the advisor is the primary advisor for the team |

## Team object definition

> Team Object

```shell
{
    "id": 1,
    "name": "Some Team",
    "external_id": "45912d",
    "description": "Team description",
    "company": 1,
    "rep_codes": ["rep_code1", "rep_code2"],
    "team_memberships": [
        {...TeamMembership Object},
        {...TeamMembership Object}
    ]
}
```

| Name             | Type        | Description                                                     |
|------------------|-------------|-----------------------------------------------------------------|
| id               | int         | Team id                                                         |
| name             | string      | Team name                                                       |
| external_id      | string      | External id                                                     |
| description      | string      | Team description                                                |
| company          | int         | Company id                                                      |
| rep_codes        | string list | List of rep codes                                               |
| team_memberships | object list | List of [team memberships](#teammembership-object-definition)   |

## List Teams

> List Teams

```shell
curl "https://backend.stratifi.com/api/v1/teams/" -H "Authorization
```

```shell
{
  "count": 1,
    "next": null,
    "previous": null,
    "results": [
      {...Team Object},
      {...Team Object},
    ]
}
```

-request-type: GET

-request-url: `/teams/`

**Response Fields**

| Name     | Type        | Description                                     |
|----------|-------------|-------------------------------------------------|
| count    | int         | Total number of advisors                        |
| next     | string      | Link to next page of advisors                   |
| previous | string      | Link to previous page of advisors               |
| results  | object list | List of [team objects](#team-object-definition) |

**Filtering Fields**

| Name        | Type   | Description             |
|-------------|--------|-------------------------|
| company     | int    | Company ID              |
| external_id | string | Your advisor identifier |

## Get team by id

> Get team by id

```shell
curl "https://backend.stratifi.com/api/v1/teams/1/" -H "Authorization
```

```shell
{...Team Object}
```

-request-type: GET

-request-url: `/teams/<team_id>`

**Response:** The requested [team object](#team-object-definition).

## Create team

> Create team

```shell
curl -X POST "https://backend.stratifi.com/api/v1/teams/" -H "Authorization
  -d '{
    "name": "Some Team",
    "company": 1,
    "team_memberships": [
      {
        "advisor": 1,
        "is_primary": true
      }
    ],
    "external_id": "45912d",
    "description": "Team description",
    "rep_codes": ["rep_code1", "rep_code2"]
  }'
```

```shell
{...New Team Object}
```

-request-type: POST

-request-url: `/teams/`

**Request Parameters**

| Parameter        | Type                                                       |          |
|------------------|------------------------------------------------------------|----------|
| name             | string                                                     | Required |
| company          | int                                                        | Required |
| team_memberships | [team-memberships list](#teammembership-object-definition) | Optional |
| external_id      | string                                                     | Optional |
| description      | string                                                     | Optional |
| rep_codes        | string list                                                | Optional |

**Response:** The new [team object](#team-object-definition).

## Update team

> Update team

```shell
curl -X PATCH "https://backend.stratifi.com/api/v1/teams/1/" -H "Authorization
  -d '{
    "name": "Some Team",
    "company": 1,
    "team_memberships": [
      {
        "advisor": 1,
        "is_primary": true
      }
    ]
  }'
```

```shell
{...Updated Team Object}
```

-request-type: PUT/PATCH

-request-url: `/teams/<id>/`

**Request Parameters**

| Parameter        | Type                                                       | PUT      | PATCH    |
|------------------|------------------------------------------------------------|----------|----------|
| name             | string                                                     | Required | Optional |
| company          | int                                                        | Required | Optional |
| team_memberships | [team-memberships list](#teammembership-object-definition) | Optional | Optional |
| external_id      | string                                                     | Optional | Optional |
| description      | string                                                     | Optional | Optional |
| rep_codes        | string list                                                | Optional | Optional |

The provided `team_memberships` list replaces the existing list. If not provided, no changes are made.

**Response:** The updated [team object](#team-object-definition).

## Delete team

> Delete team

```shell
curl -X DELETE "https://backend.stratifi.com/api/v1/teams/1/" -H "Authorization
```

-request-type: DELETE

-request-url: `/teams/<id>/`
