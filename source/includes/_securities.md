# Securities

> Security Object

```shell
{
    "ticker": "GOOGL",
    "cusip": "02079K305",
    "isin": "US02079K3059",
    "ticker_name": "Alphabet Inc",
    "type": "Equity",
    "subtype": "US",
    "sector": "Large Cap",
    "prism_score": {
        "concentrated": 10,
        "overall": 9.3,
        "tail": 9,
        "correlation": 6,
        "volatility": 10,
        "upside_capture_ratio": 1.33886097996,
        "downside_capture_ratio": 0.863528362089

    }
}
```

| Name                               | Type   | Description                          |
| ---------------------------------- | ------ | ------------------------------------ |
| ticker                             | string | Asset symbol                         |
| cusip                              | string | Asset cusip                          |
| isin                               | string | ISIN identifier                      |
| ticker_name                        | string | Asset description                    |
| type                               | string | Asset type                           |
| subtype                            | string | Asset subtype                        |
| sector                             | string | Asset sector                         |
| prism_score.overall                | float  | Overall risk score                   |
| prism_score.concentrated           | float  | Concentrated risk score              |
| prism_score.tail                   | float  | Tail risk score                      |
| prism_score.volatility             | float  | Volatility risk score                |
| prism_score.correlation            | float  | Correlation risk score               |
| prism_score.downside_capture_ratio | float  | Asset downside capture vs the market |
| prism_score.upside_capture_ratio   | float  | Asset upside capture vs the market   |

## Get security by ticker

-request-type: GET

-request-url: `/securties/ticker/<ticker>`

> Get security by ticker

```shell
curl "https://backend.stratifi.com/api/v1/securities/ticker/GOOGL" -H "Authorization: Bearer {{ access-token }}"
```

## Get security by cusip

-request-type: GET

-request-url: `/securties/cusip/<cusip>`

> Get security by cusip

```shell
curl "https://backend.stratifi.com/api/v1/securities/cusip/02079K305" -H "Authorization: Bearer {{ access-token }}"
```
