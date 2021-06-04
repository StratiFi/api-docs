# Model Portfolios

## Model Portfolio Object Definition

> Model Portfolio Object

```shell
{
  "id": 1,
  "external_id": "mp-1",
  "name": "80% Equities / 20% Fixed Income",
  "value": 100.0,
  "type": "Aggressive",
  "company": 1,
  "positions": [
    {
        "ticker": "AGG",
        "ticker_name": "iShares Core US Aggregate Bond",
        "value": 20.0
    },
    {
        "ticker": "SPY",
        "ticker_name": "SPDR S&P500 ETF Trust",
        "value": 80.0
    }
  ],
  "risk": {…}
}
```

| Name        | Type                                    | Description              |
| ----------- | --------------------------------------- | ------------------------ |
| id          | int                                     | Model Portfolio ID       |
| external_id | string                                  | Your model identifier    |
| name        | string                                  | Model Portfolio name     |
| value       | string                                  | Model Portfolio value    |
| type        | string                                  | Model Portfolio type     |
| company     | int                                     | Company ID               |
| positions[] | List of [Positions Objects](#positions) | Model Portfolio holdings |
| risk        | [Risk Object](#risk-object-definition)  | Model Portfolio risk     |

## List Model Portfolios

> List Model Portfolios

```shell
curl "https://backend.stratifi.com/api/v1/models/" -H "Authorization: Bearer {{ access-token }}"

{
  "count": 10,
  "next": "https://backend.stratifi.com/api/v1/models/?page=2",
  "previous": null,
  "results": [
    {
      "id": 1,
      "external_id": "mp-1",
      "name": "80% Equities / 20% Fixed Income",
      "value": 100.0,
      "type": "Aggressive",
      "company": 1,
      "positions": [ … ],
      "risk": { … }
    },
    …
  ]
}
```

-request-type: GET

-request-url: `/models/`

**Response Fields**

| Name     | Type   | Description                                       |
| -------- | ------ | ------------------------------------------------- |
| count    | int    | Total number of models                            |
| next     | string | Link to next page of models                       |
| previous | string | Link to previous page of models                   |
| results  | Object | List of [model objects](#model-object-definition) |

**Filtering Fields**

| Name        | Type   | Description           |
| ----------- | ------ | --------------------- |
| external_id | string | Your model identifier |

## Get Model Portfolio

> Get Model Portfolio

```shell
curl "https://backend.stratifi.com/api/v1/models/1/" -H "Authorization: Bearer {{ access-token }}"

{
  "id": 1,
  "external_id": "mp-1",
  "name": "80% Equities / 20% Fixed Income",
  "value": 100.0,
  "type": "Aggressive",
  "company": 1,
  "positions": [ … ],
  "risk": { … }
}
```

-request-type: GET

-request-url: `/models/<id>/`

**Response:** The requested [model object](#model-object-definition).

## Create Model Portfolio

> Create Model Portfolio

```shell
curl -X POST "https://backend.stratifi.com/api/v1/models/" -H "Authorization: Bearer {{ access-token }}" \
  -d '{
    "external_id": "mp-1",
    "name": "80% Equities / 20% Fixed Income",
    "value": 100.0,
    "type": "Aggressive",
    "company": 1,
    "positions": [
      {
          "ticker": "AGG",
          "ticker_name": "iShares Core US Aggregate Bond",
          "value": 20.0
      },
      {
          "ticker": "SPY",
          "ticker_name": "SPDR S&P500 ETF Trust",
          "value": 80.0
      }
    ]
  }'

{
  "id": 1,
  "external_id": "mp-1",
  "name": "80% Equities / 20% Fixed Income",
  "value": 100.0,
  "type": "Aggressive",
  "company": 1,
  "positions": [ … ],
  "risk": { … }
}
```

-request-type: POST

-request-url: `/models/`

**Request Parameters**

| Parameter   | Type                                    |          |
| ----------- | --------------------------------------- | -------- |
| name        | string                                  | Required |
| positions[] | List of [Positions Objects](#positions) | Required |
| value       | string                                  | Optional |
| type        | string                                  | Optional |
| company     | int                                     | Optional |
| external_id | int                                     | Optional |

**Response:** The new [model object](#model-object-definition).

## Update Model Portfolio

> Update Model Portfolio

```shell
curl -X PUT "https://backend.stratifi.com/api/v1/models/1/" -H "Authorization: Bearer {{ access-token }}" \
  -d '{
    "external_id": "mp-1",
    "name": "70% Equities / 30% Fixed Income",
    "value": 100.0,
    "type": "Moderate",
    "company": 1,
    "positions": [
      {
          "ticker": "AGG",
          "ticker_name": "iShares Core US Aggregate Bond",
          "value": 30.0
      },
      {
          "ticker": "SPY",
          "ticker_name": "SPDR S&P500 ETF Trust",
          "value": 70.0
      }
    ]
  }'

{
  "id": 1,
  "external_id": "mp-1",
  "name": "80% Equities / 20% Fixed Income",
  "value": 100.0,
  "type": "Moderate",
  "company": 1,
  "positions": [ … ],
  "risk": { … }
}
```

-request-type: PUT/PATCH

-request-url: `/models/<id>/`

**Request Parameters**

| Parameter   | Type                                    |          |
| ----------- | --------------------------------------- | -------- |
| name        | string                                  | Required |
| positions[] | List of [Positions Objects](#positions) | Required |
| value       | string                                  | Optional |
| type \*     | string                                  | Optional |
| company     | int                                     | Optional |
| external_id | int                                     | Optional |

## Model Portfolio Prism Score

> Model Portfolio Prism Score

```shell
curl "https://backend.stratifi.com/api/v1/models/11/prism_score/" -H "Authorization: Bearer {{ access-token }}"

{
  "scores": {…},
  "media": {…},
}
```

-request-type: GET

-request-url: `/models/<id>/prism_score/`

**Response Fields**

| Name   | Type                              | Description               |
| ------ | --------------------------------- | ------------------------- |
| scores | [Scores Factors](#scores-factors) | Risk score factors        |
| media  | [Scores Images](#scores-media)    | Risk score factors images |
| status | [Scores Status](#scores-status)   | Risk score status         |
