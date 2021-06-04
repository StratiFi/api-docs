# Accounts

## Account Object Definition

> Account Object

```shell
{
  "id": 1,
  "external_id": "act-1",
  "name": "John Doe Trust",
  "value": "1234567.89",
  "type": "100",
  "tax_status": "taxable",
  "number": "987654321",
  "investor": 1,
  "advisor": 1,
  "strategy": 1,
  "positions": [
    {
        "ticker": "OPPI",
        "ticker_name": "VANGUARD TARGET 2045",
        "value": 368673.6
    },
    {
        "ticker": "UNTB",
        "ticker_name": "Fha Non Int Bearing",
        "value": 875.0
    }
  ],
  "risk": {…},
  "tolerance": {…},
  "drift": 1.7
}
```

| Name        | Type                                             | Description                                                                                                                                                                                                                                                                |
| ----------- | ------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id          | int                                              | Account ID                                                                                                                                                                                                                                                                 |
| external_id | string                                           | Your account identifier                                                                                                                                                                                                                                                    |
| name        | string                                           | Account name                                                                                                                                                                                                                                                               |
| value       | string                                           | Account value                                                                                                                                                                                                                                                              |
| type        | string                                           | Account type .                                                                                                                                                                                                                                                             |
| tax_status  | string                                           | Account tax status. One of [these values](http://api.stratifi.com/docs/v1/#account-tax-statuses).                                                                                                                                                                          |
| number      | string                                           | Account number                                                                                                                                                                                                                                                             |
| strategy    | int                                              | Account strategy represented as Model Portfolio Id. You can find the desired model portfolio using the [list or get endpoint](http://api.stratifi.com/docs/v1/#list-model-portfolios).                                                                                     |
| investor    | int                                              | Investor ID                                                                                                                                                                                                                                                                |
| advisor     | int                                              | Advisor ID. Ideally, you would provide the investor ID. However, if you don't have that information but you know who is the advisor that owns this account then you can pass the advisor ID. We will assign the account to the `default_investor` of the selected advisor. |
| positions[] | List of [Positions Objects](#positions)          | Account holdings                                                                                                                                                                                                                                                           |
| risk        | [Risk Object](#risk-object-definition)           | Account risk                                                                                                                                                                                                                                                               |
| tolerance   | [Tolerance Object](#tolerance-object-definition) | Account tolerance                                                                                                                                                                                                                                                          |
| drift       | float                                            | Drift between the risk and the tolerance overall scores                                                                                                                                                                                                                    |

### Account Tax Statuses

| Value        | Description           |
| ------------ | --------------------- |
| taxable      | Taxable accounts      |
| tax-exempt   | Tax Exempt accounts   |
| tax-deferred | Tax Deferred accounts |

## List Accounts

-request-type: GET

-request-url: `/accounts/`

> List Accounts

```shell
curl "https://backend.stratifi.com/api/v1/accounts/" -H "Authorization: Bearer {{ access-token }}"

{
  "count": 10,
  "next": "https://backend.stratifi.com/api/v1/accounts/?page=2",
  "previous": null,
  "results": [
    {
      "id": 1,
      "external_id": "act-1",
      "name": "John Doe Trust",
      "value": "1234567.89",
      "type": "100",
      "tax_status": "taxable",
      "number": "987654321",
      "investor": 1,
      "advisor": 1,
      "strategy": 1,
      "positions": [ … ],
      "risk": { … },
      "tolerance": { … },
      "drift": 1.0,
    },
    …
  ]
}
```

**Response Fields**

| Name     | Type   | Description                                           |
| -------- | ------ | ----------------------------------------------------- |
| count    | int    | Total number of accounts                              |
| next     | string | Link to next page of accounts                         |
| previous | string | Link to previous page of accounts                     |
| results  | Object | List of [account objects](#account-object-definition) |

**Filtering Fields**

| Name        | Type   | Description             |
| ----------- | ------ | ----------------------- |
| external_id | string | Your account identifier |
| investor    | int    | Investor ID             |
| household   | int    | Household ID            |

## Get Account

> Get Account

```shell
curl "https://backend.stratifi.com/api/v1/accounts/1/" -H "Authorization: Bearer {{ access-token }}"

{
  "id": 1,
  "external_id": "act-1",
  "name": "John Doe Trust",
  "value": "1234567.89",
  "type": "100",
  "tax_status": "tax-exempt",
  "number": "987654321",
  "investor": 1,
  "advisor": 1,
  "positions": [ … ],
  "risk": { … },
  "tolerance": { … },
  "drift": 1.0,
}
```

-request-type: GET

-request-url: `/accounts/<id>/`

**Response:** The requested [account object](#account-object-definition).

## Create Account

> Create Account

```shell
curl -X POST "https://backend.stratifi.com/api/v1/accounts/" -H "Authorization: Bearer {{ access-token }}" \
  -d '{
    "external_id": "act-1",
    "name": "John Doe Trust",
    "value": "1234567.89",
    "type": "100",
    "tax_status": "tax-exempt",
    "number": "987654321",
    "investor": 1,
    "positions": [
      {
        "ticker": "SPY",
        "ticker_name": "SPDR S&P 500",
        "value": "823045.26"
      },
      {
        "ticker": "IBM",
        "ticker_name": "IBM",
        "value": "411522.63"
      },
      …
    ]
  }'

{
  "id": 1,
  "external_id": "act-1",
  "name": "John Doe Trust",
  "value": "1234567.89",
  "type": "100",
  "tax_status": "tax-exempt",
  "number": "987654321",
  "investor": 1,
  "advisor": 1,
  "strategy": 1,
  "positions": [ … ],
  "risk": { … },
  "tolerance": { … },
  "drift": 1.0,
}
```

-request-type: POST

-request-url: `/accounts/`

**Request Parameters**

| Parameter   | Type                                    |          |
| ----------- | --------------------------------------- | -------- |
| name        | string                                  | Required |
| positions[] | List of [Positions Objects](#positions) | Required |
| value       | string                                  | Optional |
| type        | string                                  | Optional |
| tax_status  | string                                  | Optional |
| number      | string                                  | Optional |
| investor    | int                                     | Optional |
| advisor     | int                                     | Optional |
| strategy    | int                                     | Optional |
| external_id | string                                  | Optional |

**Response:** The new [account object](#account-object-definition).

## Update Account

> Update Account

```shell
curl -X PUT "https://backend.stratifi.com/api/v1/accounts/1/" -H "Authorization: Bearer {{ access-token }}" \
  -d '{
    "external_id": "act-1",
    "name": "John Doe 401k",
    "value": "1234567.89",
    "type": "401",
    "tax_status": "tax-deferred",
    "number": "987654321",
    "investor": 1,
    "strategy": 1,
    "positions": [
      {
        "ticker": "SPY",
        "ticker_name": "SPDR S&P 500",
        "value": "823045.26"
      },
      {
        "ticker": "IBM",
        "ticker_name": "IBM",
        "value": "411522.63"
      },
      …
    ]
  }'

{
  "id": 1,
  "external_id": "act-1",
  "name": "John Doe Trust",
  "value": "1234567.89",
  "type": "100",
  "tax_status": "tax-deferred",
  "number": "987654321",
  "investor": 1,
  "advisor": 1,
  "strategy": 1,
  "positions": [ … ],
  "risk": { … },
  "tolerance": { … },
  "drift": 1.0,
}
```

-request-type: PUT/PATCH

-request-url: `/accounts/<id>/`

**Request Parameters**

| Parameter      | Type                                    |          |
| -------------- | --------------------------------------- | -------- |
| name           | string                                  | Required |
| positions[]    | List of [Positions Objects](#positions) | Required |
| value          | string                                  | Optional |
| type [1]       | string                                  | Optional |
| tax_status [2] | string                                  | Optional |
| number         | string                                  | Optional |
| investor       | int                                     | Optional |
| advisor [3]    | int                                     | Optional |
| stratehy [4]   | int                                     | Optional |
| external_id    | string                                  | Optional |

## Account Prism Score

> Account Prism Score

```shell
curl "https://backend.stratifi.com/api/v1/accounts/11/prism_score/" -H "Authorization: Bearer {{ access-token }}"

{
  "scores": {…},
  "media": {…},
}
```

-request-type: GET

-request-url: `/accounts/<id>/prism_score/`

**Response Fields**

| Name   | Type                              | Description               |
| ------ | --------------------------------- | ------------------------- |
| scores | [Scores Factors](#scores-factors) | Risk score factors        |
| media  | [Scores Images](#scores-media)    | Risk score factors images |
