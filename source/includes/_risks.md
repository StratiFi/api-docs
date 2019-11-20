# Risk and Tolerance

## Risk Object Definition

| Name                                | Type   | Description                         |
| ----------------------------------- | ------ | ----------------------------------- |
| scores.overall                      | float  | Overall risk score                  |
| scores.concentrated                 | float  | Concentrated risk score             |
| scores.tail                         | float  | Tail risk score                     |
| scores.volatility                   | float  | Volatility risk score               |
| scores.correlation                  | float  | Correlation risk score              |
| top_risk_attributions[].ticker      | string | Risk attribution ticker             |
| top_risk_attributions[].ticker_name | string | Risk attribution ticker description |
| top_risk_attributions[].risk        | float  | Risk attribution overall score      |
| top_risk_attributions[].weight      | float  | Risk attribution weight             |
| scenarios[].name                    | string | Scenario name                       |
| scenarios[].start_date              | string | Scenario start date                 |
| scenarios[].end_date                | string | Scenario end date                   |
| scenarios[].risk                    | float  | Scenario overall risk               |

> Risk Object

```shell
{
  "scores": {
      "overall": 8.1,
      "concentrated": 1,
      "tail": 10.0,
      "correlation": 8,
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
}
```

## Tolerance Object Definition

| Name                | Type  | Description                  |
| ------------------- | ----- | ---------------------------- |
| scores.overall      | float | Overall tolerance score      |
| scores.concentrated | float | Concentrated tolerance score |
| scores.tail         | float | Tail tolerance score         |
| scores.volatility   | float | Volatility tolerance score   |
| scores.correlation  | float | Correlation tolerance score  |

> Tolerance Object

```shell
{
  "scores": {
      "overall": 6.4,
      "concentrated": 5,
      "tail": 5,
      "volatility": 8,
      "correlation": 5
  }
}
```
