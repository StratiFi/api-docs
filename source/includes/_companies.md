# Companies

## Company Object Definition

| Name | Type   | Description         |
| ---- | ------ | ------------------- |
| id   | int    | ID of the company   |
| name | String | Name of the company |

```shell
{
  "id": 1,
  "name": "Company A, LLC"
}

```

## List Companies

-request-type: GET

-request-url: `/companies/`

```shell
curl "https://backend.stratifi.com/v1/companies/" \
  -H "Authorization: stratifi-token"

{
    "count": 10,
    "next": "https://backend.stratifi.com/v1/companies/?page=2",
    "previous": null,
    "results": [
         {
            "id": 1,
            "name": "Companny A, LLC"
        },
        ...
    ]
}
```

**Response Fields**

| Name     | Type   | Description                                           |
| -------- | ------ | ----------------------------------------------------- |
| count    | int    | Total number of companies                             |
| next     | String | Link to next page of companies                        |
| previous | String | Link to previous page of companies                    |
| results  | Object | List of [company objects](#company-object-definition) |

## Get Company

-request-type: GET

-request-url: `/companies/<id>/`

**Request Parameters**: None.

**Response:** The [company object](#company-object-definition) of the company requested.

```shell
curl "https://backend.stratifi.com/v1/companies/1/" \
  -H "Authorization: stratifi-token"

{
  "id": 1,
  "name": "Companny A, LLC"
}
```

## Create Company

-request-type: POST

-request-url: `/companies/`

```shell
curl -X POST "https://backend.stratifi.com/v1/companies/" \
  -H "Authorization: stratifi-token" \
  -d '{"name": "Company Z, LLC"}'

{
  "id": 11,
  "name": "Companny Z, LLC"
}
```

**Request Parameters**

| Parameter | Type   | Required |
| --------- | ------ | -------- |
| name      | String | Yes      |

**Response:** The [company object](#company-object-definition) of the new company.

## Update Company

-request-type: PUT/PATCH

-request-url: `/companies/<id>/`

**Request Parameters**

| Parameter | Type   | Description         |
| --------- | ------ | ------------------- |
| name      | String | Name of the company |

```shell
curl -X PUT "https://backend.stratifi.com/v1/companies/11/"
  -H "Authorization: stratifi-token" \
  -d '{"name": "Company W, LLC"}'

{
  "id": 11,
  "name": "Companny W, LLC"
}
```

## Company Prism Aggregation

-request-type: GET

-request-url: `/companies/<id>/prism_aggregation/`

```shell
curl "https://backend.stratifi.com/v1/companies/11/prism_aggregation" \
  -H "Authorization: stratifi-token"

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
