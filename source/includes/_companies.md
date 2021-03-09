# Companies

## Company Object Definition

| Name        | Type   | Description             |
| ----------- | ------ | ----------------------- |
| id          | int    | ID of the company       |
| external_id | string | Your company identifier |
| name        | string | Name of the company     |

> Company Object

```shell
{
  "id": 1,
  "name": "Company A, LLC"
}

```

## List Companies

-request-type: GET

-request-url: `/companies/`

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

-request-type: GET

-request-url: `/companies/<id>/`

**Response:** The requested [company object](#company-object-definition).

> Get Company

```shell
curl "https://backend.stratifi.com/api/v1/companies/1/" -H "Authorization: Bearer {{ access-token }}"

{
  "id": 1,
  "external_id": "co-1",
  "name": "Companny A, LLC"
}
```

## Create Company

-request-type: POST

-request-url: `/companies/`

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

**Request Parameters**

| Parameter   | Type   |          |
| ----------- | ------ | -------- |
| name        | string | Required |
| external_id | string | Optional |

**Response:** The new [company object](#company-object-definition).

## Update Company

-request-type: PUT/PATCH

-request-url: `/companies/<id>/`

**Request Parameters**

| Parameter   | Type   |          |
| ----------- | ------ | -------- |
| name        | string | Required |
| external_id | string | Optional |

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

## Company Prism Aggregation

-request-type: GET

-request-url: `/companies/<id>/prism_aggregation/`

> Company Prism Aggregation

```shell
curl "https://backend.stratifi.com/api/v1/companies/11/prism_aggregation/" -H "Authorization: Bearer {{ access-token }}"

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
