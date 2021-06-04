# Companies

## Company Object Definition

> Company Object

```shell
{
  "id": 1,
  "name": "Company A, LLC"
}

```

| Name        | Type   | Description             |
| ----------- | ------ | ----------------------- |
| id          | int    | ID of the company       |
| external_id | string | Your company identifier |
| name        | string | Name of the company     |

## List Companies

> List Companies

```shell
curl "https://backend.stratifi.com/api/v1/companies/" -H "Authorization: Bearer {{ access-token }}"

{
  "count": 10,
  "next": "https://backend.stratifi.com/api/v1/companies/?page=2",
  "previous": null,
  "results": [
    {
        "id": 1,
        "external_id": "co-1",
        "name": "Companny A, LLC"
    },
    …
  ]
}
```

-request-type: GET

-request-url: `/companies/`

**Response Fields**

| Name     | Type   | Description                                           |
| -------- | ------ | ----------------------------------------------------- |
| count    | int    | Total number of companies                             |
| next     | string | Link to next page of companies                        |
| previous | string | Link to previous page of companies                    |
| results  | Object | List of [company objects](#company-object-definition) |

**Filtering Fields**

| Name        | Type   | Description             |
| ----------- | ------ | ----------------------- |
| external_id | string | Your company identifier |

## Get Company

> Get Company

```shell
curl "https://backend.stratifi.com/api/v1/companies/1/" -H "Authorization: Bearer {{ access-token }}"

{
  "id": 1,
  "external_id": "co-1",
  "name": "Companny A, LLC"
}
```

-request-type: GET

-request-url: `/companies/<id>/`

**Response:** The requested [company object](#company-object-definition).

## Create Company

> Create Company

```shell
curl -X POST "https://backend.stratifi.com/api/v1/companies/" -H "Authorization: Bearer {{ access-token }}" \
  -d '{"name": "Company Z, LLC", "external_id": "co-1",}'

{
  "id": 11,
  "external_id": "co-1",
  "name": "Companny Z, LLC"
}
```

-request-type: POST

-request-url: `/companies/`

**Request Parameters**

| Parameter   | Type   |          |
| ----------- | ------ | -------- |
| name        | string | Required |
| external_id | string | Optional |

**Response:** The new [company object](#company-object-definition).

## Update Company

> Update Company

```shell
curl -X PUT "https://backend.stratifi.com/api/v1/companies/11/"
  -H "Authorization: Bearer {{ access-token }}" \
  -d '{"name": "Company W, LLC", "external_id": "co-1"}'

{
  "id": 11,
  "external_id": "co-1",
  "name": "Companny W, LLC"
}
```

-request-type: PUT/PATCH

-request-url: `/companies/<id>/`

**Request Parameters**

| Parameter   | Type   |          |
| ----------- | ------ | -------- |
| name        | string | Required |
| external_id | string | Optional |

## Company Prism Aggregation

> Company Prism Aggregation

```shell
curl "https://backend.stratifi.com/api/v1/companies/11/prism_aggregation/" -H "Authorization: Bearer {{ access-token }}"

{
  "scores": {…},
  "media": {…},
}
```

-request-type: GET

-request-url: `/companies/<id>/prism_aggregation/`

**Response Fields**

| Name   | Type                              | Description               |
| ------ | --------------------------------- | ------------------------- |
| scores | [Scores Factors](#scores-factors) | Risk score factors        |
| media  | [Scores Images](#scores-media)    | Risk score factors images |
