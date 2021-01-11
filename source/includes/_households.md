# Households

## Household Object Definition

| Name    | Type   | Description    |
| ------- | ------ | -------------- |
| id      | int    | Household ID   |
| name    | string | Household Name |
| advisor | int    | Advisor ID     |

> Household Object

```shell
{
  "id": 1,
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

| Name    | Type | Description |
| ------- | ---- | ----------- |
| advisor | int  | Advisor ID  |

## Get Household

-request-type: GET

-request-url: `/households/<id>/`

**Response:** The requested [household object](#household-object-definition).

> Get Household

```shell
curl "https://backend.stratifi.com/api/v1/households/1/" -H "Authorization: Bearer {{ access-token }}"

{
  "id": 1,
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
    "name": "Smith-Pinkett Family",
    "advisor": 2
  }'

{
  "id": 11,
  "name": "Smith-Pinkett Family",
  "advisor": 2
}
```

**Request Parameters**

| Parameter | Type   |          |
| --------- | ------ | -------- |
| name      | string | Required |

**Response:** The new [household object](#household-object-definition).

## Update Household

-request-type: PUT/PATCH

-request-url: `/households/<id>/`

**Request Parameters**

| Parameter | Type   |          |
| --------- | ------ | -------- |
| name      | string | Required |

> Update Household

```shell
curl -X PUT "https://backend.stratifi.com/api/v1/households/2/"
  -H "Authorization: Bearer {{ access-token }}" \
  -d '{
    "name": "Pinkett Family",
    "advisor": 2
  }'

{
  "id": 11,
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
  "no_overlay_concentrated": 4.785445142005072,
  "no_overlay_correlation": 6.049895392953136,
  "no_overlay_overall": 8.214532798503825,
  "no_overlay_tail": 8.674759220001045,
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
