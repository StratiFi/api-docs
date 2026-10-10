# Positions

Positions are the holdings of an [account](#accounts) and the target allocation of a [model portfolio](#model-portfolios). They are sent and returned inside the `positions` list of their parent; there is no positions endpoint.

Sending `positions` on create or update **replaces the whole list**: holdings that are not sent are removed. A position is matched to the one it replaces by `ticker`, then by `cusip`.

> Account Position Object Description:

```shell
{
    "id": 98213,
    "ticker": "GOOGL",
    "ticker_name": "ALPHABET INC CLASS A",
    "cusip": "02079K305",
    "isin": "US38259P5089",
    "type": "Equity",
    "subtype": "US",
    "sector": "Large Cap",
    "security_type": "Common Stock",
    "value": 36275.50,
    "quantity": 780,
    "price": 46.5070,
    "unit": "shares",
    "cost_basis": 44473.96,
    "unrealized_gains": -8198.46,
    "purchase_date": "2021-03-15",
    "excluded": false,
    "created_at": "2026-01-05T14:12:09.120000Z",
    "updated_at": "2026-10-10T09:30:00.000000Z"
}
```

| Name             | Type     | Description                                                                                         | -         |
|------------------|----------|-----------------------------------------------------------------------------------------------------|-----------|
| id               | int      | Position ID                                                                                         | Read-only |
| ticker           | string   | Asset symbol                                                                                        | Required  |
| ticker_name      | string   | Asset description                                                                                   | Optional  |
| cusip            | string   | Asset cusip                                                                                         | Optional  |
| isin             | string   | ISIN identifier                                                                                     | Optional  |
| type             | string   | Position type                                                                                       | Read-only |
| subtype          | string   | Position subtype                                                                                    | Read-only |
| sector           | string   | Position sector                                                                                     | Read-only |
| security_type    | string   | Security type                                                                                       | Read-only |
| value            | number   | Value                                                                                               | Required  |
| quantity         | number   | Number of units of the security held                                                                | Optional  |
| price            | number   | Price per unit of the security (`value / quantity`)                                                 | Read-only |
| unit             | string   | Denomination of each unit of the security                                                           | Optional  |
| cost_basis       | number   | The total cost of the position                                                                      | Optional  |
| unrealized_gains | number   | Unrealized gains of the position                                                                    | Optional  |
| purchase_date    | date     | Purchase date (`YYYY-MM-DD`)                                                                        | Optional  |
| excluded         | bool     | Left out of risk monitoring and PRISM. See [excluded positions](#excluded-positions).               | Optional  |
| created_at       | datetime | When the position was created                                                                       | Read-only |
| updated_at       | datetime | When the position was last changed                                                                  | Read-only |

## Excluded positions

Excluded positions are returned with the rest of the holdings, with `excluded: true`. Since sending `positions` replaces the whole list, send them back when you update an account, or they are removed.

- A position sent **without** `excluded` keeps the state of the holding it replaces (`false` for a new holding).
- Changing `excluded` on an existing holding follows the same rule as the StratiFi app: managers and above can always do it, advisors only when their company allows advisors to exclude positions. Otherwise the request is rejected with a `400` that lists the tickers.

## Model portfolio positions

> Model Position Object Description:

```shell
{
    "id": 5521,
    "ticker": "VTI",
    "ticker_name": "VANGUARD TOTAL STOCK MARKET ETF",
    "cusip": "922908769",
    "isin": "US9229087690",
    "type": "Equity",
    "subtype": "US",
    "sector": "Large Cap",
    "security_type": "ETF",
    "value": 60.0,
    "created_at": "2026-01-05T14:12:09.120000Z",
    "updated_at": "2026-10-10T09:30:00.000000Z"
}
```

Model positions carry `id`, `ticker`, `ticker_name`, `cusip`, `isin`, `type`, `subtype`, `sector`, `security_type`, `value` (the weight, a percentage), `created_at` and `updated_at`, with the same rules as account positions. They have no quantity, price, cost basis or exclusion.
