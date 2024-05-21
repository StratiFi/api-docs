# Positions

> Position Object Description:

```shell
{
    "ticker": "GOOGL",
    "ticker_name": "ALPHABET INC CLASS A",
    "cusip": "02079K305",
    "isin": "US38259P5089",
    "type": "Equity",
    "subtype": "US",
    "sector": "Large Cap",
    "value": 36275.50
    "quantity": 780,
    "price": 46.5070,
    "unit": "shares",
    "cost_basis": 57.0179,
}
```

| Name        | Type   | Description                               | -         |
|-------------|--------|-------------------------------------------|-----------|
| ticker      | string | Asset symbol                              | Required  |
| ticker_name | string | Asset description                         | Optional  |
| cusip       | string | Asset cusip                               | Optional  |
| isin        | string | ISIN identifier                           | Optional  |
| type        | string | Position type                             | Read-only |
| subtype     | string | Position subtype                          | Read-only |
| sector      | string | Position sector                           | Read-only |
| value       | number | Value                                     | Required  |
| quantity    | number | Number of units of the security held      | Optional  |
| price       | number | Price per unit of the security            | Read-only |
| unit        | string | Denomination of each unit of the security | Optional  |
| cost_basis  | number | The total cost of the position            | Optional  |
