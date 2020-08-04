# Accounts

## Account Object Definition

| Name         | Type                                                     | Description                                             |
| ------------ | -------------------------------------------------------- | ------------------------------------------------------- |
| id           | int                                                      | Account ID                                              |
| name         | string                                                   | Account name                                            |
| value        | string                                                   | Account value                                           |
| type \*      | string                                                   | Account type                                            |
| number       | string                                                   | Account number                                          |
| investor     | int                                                      | Investor ID                                             |
| advisor \*\* | int                                                      | Advisor ID                                              |
| positions[]  | List of [Positions Objects](#position-object-definition) | Account holdings                                        |
| risk         | [Risk Object](#risk-object-definition)                   | Account risk                                            |
| tolerance    | [Tolerance Object](#tolerance-object-definition)         | Account tolerance                                       |
| drift        | float                                                    | Drift between the risk and the tolerance overall scores |

(\*) **Valid Account Types**

| Value | Description                                    |
| ----- | ---------------------------------------------- |
| 100   | Individual                                     |
| 101   | Joint                                          |
| 200   | Revocable Living Trust                         |
| 201   | Irrevocable Living Trust                       |
| 300   | Limited Liability Company                      |
| 301   | Limited Liability Limited Partnership          |
| 302   | S Corporation                                  |
| 303   | C Corporation                                  |
| 304   | Sole Proprietorship                            |
| 400   | Traditional IRA                                |
| 401   | Simplified Employee Pension IRA                |
| 402   | Savings Incentive Match Plan for Employees IRA |
| 403   | Roth IRA                                       |
| 404   | Rollover IRA                                   |
| 500   | Household Account                              |

(\*\*) Ideally, you would provide the investor ID. However, if you don't have that information but you know who is the advisor that owns this account then you can pass the advisor ID. We will assign the account to the `default_investor` of the selected advisor.

> Account Object

```shell
{
  "id": 1,
  "name": "John Doe Trust",
  "value": "1234567.89",
  "type": "100",
  "number": "987654321",
  "investor": 1,
  "advisor": 1,
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
  "risk": {
      "scores": {
          "concentrated": 1,
          "tail": 10.0,
          "correlation": 8,
          "overall": 8.1,
          "volatility": 8
      },
      "top_risk_attributions": [
          {
              "ticker_name": "VANGUARD TARGET 2045",
              "ticker": "OPPI",
              "risk": 0.9997862976486193,
              "weight": 99.763225
          },
          {
              "ticker_name": "Fha Non Int Bearing",
              "ticker": "UNTB",
              "risk": 0.00021370235138087705,
              "weight": 0.236775
          }
      ],
      "scenarios": [
          {
              "risk": 8.8,
              "name": "Global Financial Crisis",
              "end_date": "2009-2-1",
              "start_date": "2007-2-1"
          },
          {
              "risk": 8.8,
              "name": "2011 Euro Credit Crisis",
              "end_date": "2012-1-1",
              "start_date": "2010-1-1"
          },
          {
              "risk": 8.1,
              "name": "2013 Taper Tantrum",
              "end_date": "2014-6-1",
              "start_date": "2012-6-1"
          },
          {
              "risk": 7.7,
              "name": "2015-16 Market Selloff",
              "end_date": "2017-1-1",
              "start_date": "2015-1-1"
          }
      ]
  },
  "tolerance": {
      "scores": {
          "concentrated": 5,
          "tail": 5,
          "volatility": 8,
          "overall": 6.4,
          "correlation": 5
      }
  },
  "drift": 1.7
}
```

## List Accounts

-request-type: GET

-request-url: `/accounts/`

> List Accounts

```shell
> curl "https://backend.stratifi.com/v1/accounts/" -H "Authorization: stratifi-token"

{
  "count": 10,
  "next": "https://backend.stratifi.com/v1/accounts/?page=2",
  "previous": null,
  "results": [
    {
      "id": 1,
      "name": "John Doe Trust",
      "value": "1234567.89",
      "type": "100",
      "number": "987654321",
      "investor": 1,
      "advisor": 1,
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

## Get Account

-request-type: GET

-request-url: `/accounts/<id>/`

**Response:** The requested [account object](#account-object-definition).

> Get Account

```shell
> curl "https://backend.stratifi.com/v1/accounts/1/" -H "Authorization: stratifi-token"

{
  "id": 1,
  "name": "John Doe Trust",
  "value": "1234567.89",
  "type": "100",
  "number": "987654321",
  "investor": 1,
  "advisor": 1,
  "positions": [ … ],
  "risk": { … },
  "tolerance": { … },
  "drift": 1.0,
}
```

## Create Account

-request-type: POST

-request-url: `/accounts/`

> Create Account

```shell
> curl -X POST "https://backend.stratifi.com/v1/accounts/" -H "Authorization: stratifi-token" \
  -d '{
    "name": "John Doe Trust",
    "value": "1234567.89",
    "type": "100",
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
  "name": "John Doe Trust",
  "value": "1234567.89",
  "type": "100",
  "number": "987654321",
  "investor": 1,
  "advisor": 1,
  "positions": [ … ],
  "risk": { … },
  "tolerance": { … },
  "drift": 1.0,
}
```

**Request Parameters**

| Parameter   | Type                                                     |          |
| ----------- | -------------------------------------------------------- | -------- |
| name        | string                                                   | Required |
| value       | string                                                   | Optional |
| type        | string                                                   | Optional |
| number      | string                                                   | Optional |
| investor    | int                                                      | Optional |
| advisor     | int                                                      | Optional |
| positions[] | List of [Positions Objects](#position-object-definition) | Required |

**Response:** The new [account object](#account-object-definition).

## Update Account

-request-type: PUT/PATCH

-request-url: `/accounts/<id>/`

**Request Parameters**

| Parameter    | Type                                                     |          |
| ------------ | -------------------------------------------------------- | -------- |
| name         | string                                                   | Required |
| value        | string                                                   | Optional |
| type \*      | string                                                   | Optional |
| number       | string                                                   | Optional |
| investor     | int                                                      | Optional |
| advisor \*\* | int                                                      | Optional |
| positions[]  | List of [Positions Objects](#position-object-definition) | Required |

> Update Account

```shell
> curl -X PUT "https://backend.stratifi.com/v1/accounts/1/" -H "Authorization: stratifi-token" \
  -d '{
    "name": "John Doe 401k",
    "value": "1234567.89",
    "type": "401",
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
  "name": "John Doe Trust",
  "value": "1234567.89",
  "type": "100",
  "number": "987654321",
  "investor": 1,
  "advisor": 1,
  "positions": [ … ],
  "risk": { … },
  "tolerance": { … },
  "drift": 1.0,
}
```

## Account Prism Score

-request-type: GET

-request-url: `/accounts/<id>/prism_score/`

> Account Prism Score

```shell
> curl "https://backend.stratifi.com/v1/accounts/11/prism_score" -H "Authorization: stratifi-token"

{
  "no_overlay_concentrated": 4.214532742005072
  "no_overlay_concentrated": 4.785445142005072,
  "no_overlay_correlation": 6.049895392953136,
  "no_overlay_overall": 8.2145327985038
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
