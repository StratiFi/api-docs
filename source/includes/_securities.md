# Securities

Securities are read-only: look one up by ticker or by cusip. You only find the securities you can see in the StratiFi app: every market security, plus the custom securities your firm shares with you (and public ones). A custom security you cannot see answers `404`, the same as an unknown symbol.

> Security Object

```shell
{
    "id": 10423,
    "ticker": "VFIAX",
    "cusip": "922908710",
    "isin": "US9229087104",
    "figi": "BBG000BHTMY7",
    "ticker_name": "Vanguard 500 Index Admiral",
    "description": "Tracks the S&P 500 index.",
    "type": "Equity",
    "subtype": "US",
    "sector": "Large Cap",
    "security_type": "Mutual Fund",
    "share_class": "Admiral",
    "is_retirement": false,
    "fund_family": "Vanguard",
    "is_custom": false,
    "is_sma": false,
    "expense_ratio": 0.0004,
    "expense_ratio_updated_at": "2026-09-01T06:00:00Z",
    "distribution_yield": 0.0125,
    "distribution_yield_updated_at": "2026-09-01T06:00:00Z",
    "management_fee": null,
    "minimum_purchase_amount": 3000.0,
    "beta": 1.0,
    "marketcap": null,
    "price_to_book": null,
    "prism_score": {
        "concentrated": 10,
        "overall": 9.3,
        "tail": 9,
        "correlation": 6,
        "volatility": 10,
        "upside_capture_ratio": 1.33886097996,
        "downside_capture_ratio": 0.863528362089
    },
    "created": "2019-04-02T17:21:05Z",
    "modified": "2026-10-01T06:00:00Z"
}
```

| Name                               | Type     | Description                                                                         |
|------------------------------------|----------|-------------------------------------------------------------------------------------|
| id                                 | int      | Security ID                                                                         |
| ticker                             | string   | Asset symbol                                                                        |
| cusip                              | string   | Asset cusip                                                                         |
| isin                               | string   | ISIN identifier                                                                     |
| figi                               | string   | OpenFIGI identifier confirmed when the security was classified                      |
| ticker_name                        | string   | Asset name                                                                          |
| description                        | string   | Long description                                                                    |
| type                               | string   | Asset type                                                                          |
| subtype                            | string   | Asset subtype                                                                       |
| sector                             | string   | Asset sector                                                                        |
| security_type                      | string   | Security type                                                                       |
| share_class                        | string   | Share class, when known                                                             |
| is_retirement                      | bool     | The share class is a retirement share class                                         |
| fund_family                        | string   | Fund family name, `null` when unknown                                               |
| is_custom                          | bool     | Custom security created by a firm                                                   |
| is_sma                             | bool     | Represents a separately managed account                                             |
| expense_ratio                      | number   | Expense ratio as a decimal fraction (`0.0004` is 0.04%)                             |
| expense_ratio_updated_at           | datetime | When the expense ratio last changed, `null` if it never did                         |
| distribution_yield                 | number   | Distribution yield as a decimal fraction                                            |
| distribution_yield_updated_at      | datetime | When the distribution yield last changed, `null` if it never did                    |
| management_fee                     | number   | Management fee as a decimal fraction                                                |
| minimum_purchase_amount            | number   | Minimum initial investment                                                          |
| beta                               | number   | Beta                                                                                |
| marketcap                          | int      | Market capitalization                                                               |
| price_to_book                      | number   | Price to book ratio                                                                 |
| prism_score                        | object   | PRISM score summary, `null` while the security is unscored                          |
| prism_score.overall                | float    | Overall risk score                                                                  |
| prism_score.concentrated           | float    | Concentrated risk score                                                             |
| prism_score.tail                   | float    | Tail risk score                                                                     |
| prism_score.volatility             | float    | Volatility risk score                                                               |
| prism_score.correlation            | float    | Correlation risk score                                                              |
| prism_score.downside_capture_ratio | float    | Asset downside capture vs the market                                                |
| prism_score.upside_capture_ratio   | float    | Asset upside capture vs the market                                                  |
| created                            | datetime | When the security was added to StratiFi                                             |
| modified                           | datetime | When the security was last changed                                                  |

## Get security by ticker

> Get security by ticker

```shell
curl "https://backend.stratifi.com/api/v1/securities/ticker/GOOGL" \
  -H "Authorization: Bearer {{ access-token }}"
```

-request-type: GET

-request-url: `/securities/ticker/<ticker>`

## Get security by cusip

> Get security by cusip

```shell
curl "https://backend.stratifi.com/api/v1/securities/cusip/02079K305" \
  -H "Authorization: Bearer {{ access-token }}"
```

-request-type: GET

-request-url: `/securities/cusip/<cusip>`
