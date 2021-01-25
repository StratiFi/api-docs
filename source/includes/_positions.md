# Positions

> Position Object Description:

```shell
{
    "ticker": "GOOGL",
    "cusip": "02079K305",
    "isin": "US38259P5089",
    "ticker_name": "ALPHABET INC CLASS A",
    "type": "Equity",
    "subtype": "US",
    "sector": "Large Cap",
    "value": "36275.50"
}
```

| Name        | Type   | Description       | -         |
| ----------- | ------ | ----------------- | --------- |
| ticker      | string | Asset symbol      | Required  |
| value       | number | Value             | Required  |
| cusip       | string | Asset cusip       | Optional  |
| isin        | string | ISIN identifier   | Optional  |
| ticker_name | string | Asset description | Optional  |
| type        | string | Position type     | Read-only |
| subtype     | string | Position subtype  | Read-only |
| sector      | string | Position sector   | Read-only |
