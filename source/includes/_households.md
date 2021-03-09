# Households

## Household Object Definition

| Name        | Type   | Description               |
| ----------- | ------ | ------------------------- |
| id          | int    | Household ID              |
| external_id | string | Your household identifier |
| name        | string | Household Name            |
| advisor     | int    | Advisor ID                |

> Household Object

```shell
{
  "id": 1,
  "external_id": "hou-1",
  "name": "Smith Family"
}

```

## List Households

-request-type: GET

-request-url: `/households/`

> List Households

```shell
curl "https://backend.stratifi.com/api/v1/households/" -H "Authorization: Bearer {{ access-token }}"

{
  "count": 10,
  "next": "https://backend.stratifi.com/api/v1/households/?page=2",
  "previous": null,
  "results": [
    {
        "id": 1,
        "external_id": "hou-1",
        "name": "Smith Family"
        "advisor": 1
    },
    …
  ]
}
```

**Response Fields**

| Name     | Type   | Description                                               |
| -------- | ------ | --------------------------------------------------------- |
| count    | int    | Total number of households                                |
| next     | string | Link to next page of households                           |
| previous | string | Link to previous page of households                       |
| results  | Object | List of [household objects](#household-object-definition) |

**Filtering Fields**

| Name        | Type   | Description               |
| ----------- | ------ | ------------------------- |
| advisor     | int    | Advisor ID                |
| external_id | string | Your household identifier |

## Get Household

-request-type: GET

-request-url: `/households/<id>/`

**Response:** The requested [household object](#household-object-definition).

> Get Household

```shell
curl "https://backend.stratifi.com/api/v1/households/1/" -H "Authorization: Bearer {{ access-token }}"

{
  "id": 1,
  "external_id": "hou-1",
  "name": "Smith Family"
  "advisor": 1
}
```

## Create Household

-request-type: POST

-request-url: `/households/`

> Create Household

```shell
curl -X POST "https://backend.stratifi.com/api/v1/households/" -H "Authorization: Bearer {{ access-token }}" \
  -d '{
    "external_id": "hou-1",
    "name": "Smith-Pinkett Family",
    "advisor": 2
  }'

{
  "id": 11,
  "external_id": "hou-1",
  "name": "Smith-Pinkett Family",
  "advisor": 2
}
```

**Request Parameters**

| Parameter   | Type   |          |
| ----------- | ------ | -------- |
| name        | string | Required |
| external_id | string | Optional |

**Response:** The new [household object](#household-object-definition).

## Update Household

-request-type: PUT/PATCH

-request-url: `/households/<id>/`

**Request Parameters**

| Parameter   | Type   |          |
| ----------- | ------ | -------- |
| name        | string | Required |
| external_id | string | Optional |

> Update Household

```shell
curl -X PUT "https://backend.stratifi.com/api/v1/households/2/"
  -H "Authorization: Bearer {{ access-token }}" \
  -d '{
    "external_id": "hou-1",
    "name": "Pinkett Family",
    "advisor": 2
  }'

{
  "id": 11,
  "external_id": "hou-1",
  "name": "Pinkett Family",
  "advisor": 2
}
```

## Household Prism Aggregation

-request-type: GET

-request-url: `/households/<id>/prism_aggregation/`

> Household Prism Aggregation

```shell
curl "https://backend.stratifi.com/api/v1/households/11/prism_aggregation/" -H "Authorization: Bearer {{ access-token }}"

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
