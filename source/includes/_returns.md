# Returns

The return series of a security, or of a portfolio (an account, a model, a household or an investor), over a date range. Every resource answers `GET .../returns/` with the same query parameters and the same response.

- A security is looked up by ticker or cusip, as in [Securities](#securities), and only the securities you can see are found.
- A portfolio is looked up by id, and only the portfolios you can see are found. Its returns are computed from its current holdings.
- A household or an investor combines the accounts its aggregated PRISM score covers (excluded accounts are left out) into one portfolio.

> Returns Object

```shell
{
    "identifier": {"type": "account", "id": 30163},
    "frequency": "monthly",
    "start": "2024-01-31",
    "end": "2024-03-29",
    "data": [
        ["2024-01-31", 0.0123],
        ["2024-02-29", -0.0041],
        ["2024-03-29", 0.0217]
    ]
}
```

| Name       | Type   | Description                                                                                                     |
|------------|--------|-----------------------------------------------------------------------------------------------------------------|
| identifier | object | What the series is of: `{"type": "security", "ticker", "cusip"}`, or `{"type", "id"}` with type `account`, `model_portfolio`, `household` or `investor` |
| frequency  | string | `daily` or `monthly`                                                                                            |
| start      | date   | First date the series holds; later than the one asked for when the history is shorter                          |
| end        | date   | Last date the series holds                                                                                      |
| data       | array  | `[date, return]` pairs, oldest first; each return is a decimal fraction (`0.0123` is 1.23%)                     |

### Query Parameters

| Parameter      | Description                                                                                                                   |
|----------------|-------------------------------------------------------------------------------------------------------------------------------|
| start          | First date (`YYYY-MM-DD`). Defaults to the start of the PRISM analysis window                                                 |
| end            | Last date (`YYYY-MM-DD`). Defaults to the end of the PRISM analysis window                                                    |
| frequency      | `daily` or `monthly` (default)                                                                                                |
| management_fee | Portfolios only. Annual fee deducted from the returns, as a decimal fraction (`0.01` is 1%). Defaults to `0`: gross of fees |

### Errors

| Status | When                                                        |
|--------|-------------------------------------------------------------|
| 400    | A query parameter is invalid, or `start` is after `end`     |
| 404    | The security or portfolio does not exist or is not visible  |
| 422    | The portfolio holds no positions with a value               |
| 429    | Too many calls in a short time; retry later                 |
| 502    | Market data is unavailable; retry later                     |

## Get security returns

> Get security returns

```shell
curl "https://backend.stratifi.com/api/v1/securities/ticker/VFIAX/returns/?start=2024-01-01&frequency=monthly" \
  -H "Authorization: Bearer {{ access-token }}"
```

-request-type: GET

-request-url: `/securities/ticker/<ticker>/returns/` or `/securities/cusip/<cusip>/returns/`

## Get account returns

> Get account returns

```shell
curl "https://backend.stratifi.com/api/v1/accounts/30163/returns/?start=2024-01-01&management_fee=0.01" \
  -H "Authorization: Bearer {{ access-token }}"
```

-request-type: GET

-request-url: `/accounts/<id>/returns/`

## Get model returns

-request-type: GET

-request-url: `/models/<id>/returns/`

## Get household returns

-request-type: GET

-request-url: `/households/<id>/returns/`

## Get investor returns

-request-type: GET

-request-url: `/investors/<id>/returns/`
