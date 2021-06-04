# Risk and Tolerance

## Risk statuses

Calculating scores for a portfolio might take some time (from a few seconds to a few minutes). In order to make our system more responsive, we calculate the scores in asynchronously. That means that when an account is created or updated, we will be able to provide an immediate answer to the request and, at the same time, queue the score calculation. In the response, we provide a readable status that indicates what is happening in background. The available statuses are:

| Name              | Type   | Description                                                                 |
| ----------------- | ------ | --------------------------------------------------------------------------- |
| pending (Default) | string | The risk score calculation has not started                                  |
| processing        | string | The risk score calculation is in progress or the existing score is outdated |
| error             | string | The last risk score calculation failed                                      |
| ready             | string | The risk score calculation is completed and is up to date                   |

## Scores Factors

> Scores Factors

```shell
{
    "overall": 8.1,
    "concentrated": 1.0,
    "correlation": 8.0,
    "tail": 9.0,
    "volatility": 8.0
}
```

| Name         | Type  | Description        |
| ------------ | ----- | ------------------ |
| overall      | float | Overall score      |
| concentrated | float | Concentrated score |
| correlation  | float | Correlation score  |
| tail         | float | Tail score         |
| volatility   | float | Volatility score   |

## Scores Media

> Scores Images

```shell
{
    "overall": {
        "large": "https://scores-media.stratifi.com/10/large/81.png",
        "medium": "https://scores-media.stratifi.com/10/medium/81.png",
        "compact": "https://scores-media.stratifi.com/10/compact/81.png"
    },
    "concentrated": {
        "large": "https://scores-media.stratifi.com/10/large/10.png",
        "medium": "https://scores-media.stratifi.com/10/medium/10.png",
        "compact": "https://scores-media.stratifi.com/10/compact/10.png"
    },
    "correlation": {
        "large": "https://scores-media.stratifi.com/10/large/80.png",
        "medium": "https://scores-media.stratifi.com/10/medium/80.png",
        "compact": "https://scores-media.stratifi.com/10/compact/80.png"
    },
    "tail": {
        "large": "https://scores-media.stratifi.com/10/large/90.png",
        "medium": "https://scores-media.stratifi.com/10/medium/90.png",
        "compact": "https://scores-media.stratifi.com/10/compact/90.png"
    },
    "volatility": {
        "large": "https://scores-media.stratifi.com/10/large/80.png",
        "medium": "https://scores-media.stratifi.com/10/medium/80.png",
        "compact": "https://scores-media.stratifi.com/10/compact/80.png"
    }
}
```

| Name         | Type   | Description                   |
| ------------ | ------ | ----------------------------- |
| overall      | string | Overall score image URLs      |
| concentrated | string | Concentrated score image URLs |
| correlation  | string | Correlation score image URLs  |
| tail         | string | Tail score image URLs         |
| volatility   | string | Volatility score image URLs   |

Notice that we provide 3 image versions for each one of the score factors. You can use the version that better adjust to your site layout.

- large:

![large image](https://scores-media.stratifi.com/10/large/81.png)

- medium:

![medium image](https://scores-media.stratifi.com/10/medium/81.png)

- compact:

![compact image](https://scores-media.stratifi.com/10/compact/81.png)

## Risk Object Definition

> Risk Object

```shell
{
  "scores": {
      "overall": 8.1,
      "concentrated": 1.0,
      "tail": 9.0,
      "correlation": 8.0,
      "volatility": 8.0
  },
  "media": {
    "overall": {
        "large": "https://scores-media.stratifi.com/10/large/81.png",
        "medium": "https://scores-media.stratifi.com/10/medium/81.png",
        "compact": "https://scores-media.stratifi.com/10/compact/81.png"
    },
    "concentrated": {
        "large": "https://scores-media.stratifi.com/10/large/10.png",
        "medium": "https://scores-media.stratifi.com/10/medium/10.png",
        "compact": "https://scores-media.stratifi.com/10/compact/10.png"
    },
    "correlation": {
        "large": "https://scores-media.stratifi.com/10/large/80.png",
        "medium": "https://scores-media.stratifi.com/10/medium/80.png",
        "compact": "https://scores-media.stratifi.com/10/compact/80.png"
    },
    "tail": {
        "large": "https://scores-media.stratifi.com/10/large/90.png",
        "medium": "https://scores-media.stratifi.com/10/medium/90.png",
        "compact": "https://scores-media.stratifi.com/10/compact/90.png"
    },
    "volatility": {
        "large": "https://scores-media.stratifi.com/10/large/80.png",
        "medium": "https://scores-media.stratifi.com/10/medium/80.png",
        "compact": "https://scores-media.stratifi.com/10/compact/80.png"
    }
  },
  "status": "processing",
  "created": "2021-04-21T15:11:37.564188",
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

| Name                                | Type                              | Description                         |
| ----------------------------------- | --------------------------------- | ----------------------------------- |
| scores                              | [Scores Factors](#scores-factors) | Risk score factors                  |
| media                               | [Scores Images](#scores-media)    | Risk score factors images           |
| status                              | [Risk Status](#risk-statuses)     | Risk score status                   |
| created                             | date                              | Score timestamp                     |
| top_risk_attributions[].ticker      | string                            | Risk attribution ticker             |
| top_risk_attributions[].ticker_name | string                            | Risk attribution ticker description |
| top_risk_attributions[].risk        | float                             | Risk attribution overall score      |
| top_risk_attributions[].weight      | float                             | Risk attribution weight             |
| scenarios[].name                    | string                            | Scenario name                       |
| scenarios[].start_date              | string                            | Scenario start date                 |
| scenarios[].end_date                | string                            | Scenario end date                   |
| scenarios[].risk                    | float                             | Scenario overall risk               |

## Tolerance Object Definition

> Tolerance Object

```shell
{
  "scores": {
      "overall": 6.4,
      "concentrated": 5.0,
      "correlation": 5.0,
      "tail": 5.0,
      "volatility": 8.0
  },
  "media": {
    "overall": {
        "large": "https://scores-media.stratifi.com/10/large/64.png",
        "medium": "https://scores-media.stratifi.com/10/medium/64.png",
        "compact": "https://scores-media.stratifi.com/10/compact/64.png"
    },
    "concentrated": {
        "large": "https://scores-media.stratifi.com/10/large/50.png",
        "medium": "https://scores-media.stratifi.com/10/medium/50.png",
        "compact": "https://scores-media.stratifi.com/10/compact/50.png"
    },
    "correlation": {
        "large": "https://scores-media.stratifi.com/10/large/50.png",
        "medium": "https://scores-media.stratifi.com/10/medium/50.png",
        "compact": "https://scores-media.stratifi.com/10/compact/50.png"
    },
    "tail": {
        "large": "https://scores-media.stratifi.com/10/large/50.png",
        "medium": "https://scores-media.stratifi.com/10/medium/50.png",
        "compact": "https://scores-media.stratifi.com/10/compact/50.png"
    },
    "volatility": {
        "large": "https://scores-media.stratifi.com/10/large/80.png",
        "medium": "https://scores-media.stratifi.com/10/medium/80.png",
        "compact": "https://scores-media.stratifi.com/10/compact/80.png"
    }
}
}
```

| Name   | Type                              | Description                    |
| ------ | --------------------------------- | ------------------------------ |
| scores | [Scores Factors](#scores-factors) | Tolerance score factors        |
| media  | [Scores Images](#scores-media)    | Tolerance score factors images |
