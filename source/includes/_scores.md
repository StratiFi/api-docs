# Scores

The API allows you to compute two types of scores. Risks and Returns.

## Risks

The Risks Scores describes the susceptibility of your portfolio to the various events.

### Current

This API computes the Risks Scores of your current portfolio

> To send request:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/risks/current"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
          "ticker": "CASH",
          "value": 4.3
        },
        {
          "ticker": "ISFCX",
          "value": 42.22
        },
        {
          "ticker": "LCEVX",
          "value": 46.83
        },
        {
          "ticker": "AHHYX",
          "value": 6.65
        }
      ]
    }'
```

> Reponse Body

```shell
{
  "custom": {
    "risk_scores": [
      {
        "score_list": [
          {
            "data": {
              "relative_non_stock_weights": {
                "SHY": 0.3926940639269407,
                "AHHYX": 0.6073059360730594
              },
              "relative_stock_weights": {}
            },
            "name": "concentrated_score",
            "value": 1
          },
          {
            "data": {
              "short_vol_fraction": 1,
              "long_vol_beta": 0,
              "short_vol_beta": 0.121,
              "long_vol_fraction": 0,
              "classifications": {
                "2": 0.3926940639269407,
                "3": 0.6073059360730594
              }
            },
            "name": "volatility_score",
            "value": 7
          },
          {
            "data": {
              "correlation_benchmarks_min": {
                "SPY": 0.784534212372259,
                "VIX": -0.8687271960279799,
                "GLD": -0.3178823355791606,
                "VNQ": 0.3370350133054418,
                "BND": -0.532085308483456
              },
              "correlation_benchmarks_mean": {
                "SPY": 0.903699964659445,
                "VIX": -0.7613946015955493,
                "GLD": -0.01502059350126294,
                "VNQ": 0.739743313878686,
                "BND": -0.2714347101681557
              },
              "correlation_benchmarks_max": {
                "SPY": 0.9594761534205081,
                "VIX": -0.544979575853418,
                "GLD": 0.4365016929243542,
                "VNQ": 0.9189512211782341,
                "BND": 0.4577926372323846
              }
            },
            "name": "correlation_score",
            "value": 5
          },
          {
            "data": {
              "median_portfolio_move": [
                [
                  "[-0% -2%]",
                  -0.010323714748607247
                ],
                [
                  "[-2% -4%]",
                  -0.03469457586165013
                ],
                [
                  "[-4% -6%]",
                  -0.06395665996187737
                ],
                [
                  "[-6% -8%]",
                  -0.09702327861823168
                ],
                [
                  "[-8% -10%]",
                  -0.13740675311485964
                ],
                [
                  "[-10%+]",
                  -0.16545972838662798
                ]
              ],
              "worst_market_move": -0.19632559765788316,
              "median_market_move": [
                [
                  "[-0% -2%]",
                  -0.007029375671891979
                ],
                [
                  "[-2% -4%]",
                  -0.026639321998952213
                ],
                [
                  "[-4% -6%]",
                  -0.047340701224977355
                ],
                [
                  "[-6% -8%]",
                  -0.06882447034676904
                ],
                [
                  "[-8% -10%]",
                  -0.0845268156918576
                ],
                [
                  "[-10%+]",
                  -0.13221290755649556
                ]
              ]
            },
            "name": "tail_score",
            "value": 8
          }
        ],
        "overall_score": 6.2,
        "overlay": {
          "tail": 0,
          "rr": 0,
          "rerr": 0
        }
      }
    ],
    "end_date": "2018-06-13",
    "start_date": "2005-01-01"
  },
  "Global Financial Crisis": {
    "risk_scores": [
      {
        "score_list": [
          {
            "data": {
              "relative_non_stock_weights": {
                "SHY": 0.3926940639269407,
                "AHHYX": 0.6073059360730594
              },
              "relative_stock_weights": {}
            },
            "name": "concentrated_score",
            "value": 1
          },
          {
            "data": {
              "short_vol_fraction": 1,
              "long_vol_beta": 0,
              "short_vol_beta": 0.447,
              "long_vol_fraction": 0,
              "classifications": {
                "2": 0.3926940639269407,
                "3": 0.6073059360730594
              }
            },
            "name": "volatility_score",
            "value": 10
          },
          {
            "data": {
              "correlation_benchmarks_min": {
                "SPY": 0.8040191954022479,
                "VIX": -0.8224199336746263,
                "GLD": -0.3518502137972266,
                "VNQ": 0.6936785607451148,
                "BND": -0.43326913277166523
              },
              "correlation_benchmarks_mean": {
                "SPY": 0.8739492150626034,
                "VIX": -0.7424093306617923,
                "GLD": -0.16786406609401608,
                "VNQ": 0.7696572456535902,
                "BND": -0.35731980488183585
              },
              "correlation_benchmarks_max": {
                "SPY": 0.9106268489222078,
                "VIX": -0.6564780069618203,
                "GLD": 0.2633188611077413,
                "VNQ": 0.8057288330998789,
                "BND": 0.3876913885621447
              }
            },
            "name": "correlation_score",
            "value": 8
          },
          {
            "data": {
              "median_portfolio_move": [
                [
                  "[-0% -2%]",
                  -0.010323714748607247
                ],
                [
                  "[-2% -4%]",
                  -0.03469457586165013
                ],
                [
                  "[-4% -6%]",
                  -0.06395665996187737
                ],
                [
                  "[-6% -8%]",
                  -0.09702327861823168
                ],
                [
                  "[-8% -10%]",
                  -0.13740675311485964
                ],
                [
                  "[-10%+]",
                  -0.16545972838662798
                ]
              ],
              "worst_market_move": -0.19632559765788316,
              "median_market_move": [
                [
                  "[-0% -2%]",
                  -0.007029375671891979
                ],
                [
                  "[-2% -4%]",
                  -0.026639321998952213
                ],
                [
                  "[-4% -6%]",
                  -0.047340701224977355
                ],
                [
                  "[-6% -8%]",
                  -0.06882447034676904
                ],
                [
                  "[-8% -10%]",
                  -0.0845268156918576
                ],
                [
                  "[-10%+]",
                  -0.13221290755649556
                ]
              ]
            },
            "name": "tail_score",
            "value": 8
          }
        ],
        "overall_score": 8.1,
        "overlay": {
          "tail": 0,
          "rr": 0,
          "rerr": 0
        }
      }
    ],
    "end_date": "2009-02-01",
    "start_date": "2007-02-01"
  },
  "2011 Euro Credit Crisis": {
    "risk_scores": [
      {
        "score_list": [
          {
            "data": {
              "relative_non_stock_weights": {
                "SHY": 0.3926940639269407,
                "AHHYX": 0.6073059360730594
              },
              "relative_stock_weights": {}
            },
            "name": "concentrated_score",
            "value": 1
          },
          {
            "data": {
              "short_vol_fraction": 1,
              "long_vol_beta": 0,
              "short_vol_beta": 0.223,
              "long_vol_fraction": 0,
              "classifications": {
                "2": 0.3926940639269407,
                "3": 0.6073059360730594
              }
            },
            "name": "volatility_score",
            "value": 10
          },
          {
            "data": {
              "correlation_benchmarks_min": {
                "SPY": 0.9126101464862375,
                "VIX": -0.88346831944512,
                "GLD": -0.21131277046807145,
                "VNQ": 0.6848646607755302,
                "BND": -0.5384094830469406
              },
              "correlation_benchmarks_mean": {
                "SPY": 0.9454990986614913,
                "VIX": -0.8155743584982533,
                "GLD": 0.1887208735236684,
                "VNQ": 0.8721734474453802,
                "BND": -0.39681779748695867
              },
              "correlation_benchmarks_max": {
                "SPY": 0.9624274816287923,
                "VIX": -0.7464369587833878,
                "GLD": 0.29904917370031925,
                "VNQ": 0.9222907174105153,
                "BND": -0.030822833865099087
              }
            },
            "name": "correlation_score",
            "value": 5
          },
          {
            "data": {
              "median_portfolio_move": [
                [
                  "[-0% -2%]",
                  -0.010323714748607247
                ],
                [
                  "[-2% -4%]",
                  -0.03469457586165013
                ],
                [
                  "[-4% -6%]",
                  -0.06395665996187737
                ],
                [
                  "[-6% -8%]",
                  -0.09702327861823168
                ],
                [
                  "[-8% -10%]",
                  -0.13740675311485964
                ],
                [
                  "[-10%+]",
                  -0.16545972838662798
                ]
              ],
              "worst_market_move": -0.19632559765788316,
              "median_market_move": [
                [
                  "[-0% -2%]",
                  -0.007029375671891979
                ],
                [
                  "[-2% -4%]",
                  -0.026639321998952213
                ],
                [
                  "[-4% -6%]",
                  -0.047340701224977355
                ],
                [
                  "[-6% -8%]",
                  -0.06882447034676904
                ],
                [
                  "[-8% -10%]",
                  -0.0845268156918576
                ],
                [
                  "[-10%+]",
                  -0.13221290755649556
                ]
              ]
            },
            "name": "tail_score",
            "value": 8
          }
        ],
        "overall_score": 7.8,
        "overlay": {
          "tail": 0,
          "rr": 0,
          "rerr": 0
        }
      }
    ],
    "end_date": "2012-01-01",
    "start_date": "2010-01-01"
  },
  "2013 Taper Tantrum": {
    "risk_scores": [
      {
        "score_list": [
          {
            "data": {
              "relative_non_stock_weights": {
                "SHY": 0.3926940639269407,
                "AHHYX": 0.6073059360730594
              },
              "relative_stock_weights": {}
            },
            "name": "concentrated_score",
            "value": 1
          },
          {
            "data": {
              "short_vol_fraction": 1,
              "long_vol_beta": 0,
              "short_vol_beta": 0.083,
              "long_vol_fraction": 0,
              "classifications": {
                "2": 0.3926940639269407,
                "3": 0.6073059360730594
              }
            },
            "name": "volatility_score",
            "value": 4
          },
          {
            "data": {
              "correlation_benchmarks_min": {
                "SPY": 0.8778896629164408,
                "VIX": -0.7788247398695489,
                "GLD": -0.11212171439904768,
                "VNQ": 0.5205970621992217,
                "BND": -0.475864461642886
              },
              "correlation_benchmarks_mean": {
                "SPY": 0.9163375995351724,
                "VIX": -0.7352099948355328,
                "GLD": 0.18744513297480425,
                "VNQ": 0.7479702048811675,
                "BND": 0.03671817282404967
              },
              "correlation_benchmarks_max": {
                "SPY": 0.9410145571862646,
                "VIX": -0.6707412649698621,
                "GLD": 0.4094360097812404,
                "VNQ": 0.8066761635518418,
                "BND": 0.5685313224881158
              }
            },
            "name": "correlation_score",
            "value": 5
          },
          {
            "data": {
              "median_portfolio_move": [
                [
                  "[-0% -2%]",
                  -0.010323714748607247
                ],
                [
                  "[-2% -4%]",
                  -0.03469457586165013
                ],
                [
                  "[-4% -6%]",
                  -0.06395665996187737
                ],
                [
                  "[-6% -8%]",
                  -0.09702327861823168
                ],
                [
                  "[-8% -10%]",
                  -0.13740675311485964
                ],
                [
                  "[-10%+]",
                  -0.16545972838662798
                ]
              ],
              "worst_market_move": -0.19632559765788316,
              "median_market_move": [
                [
                  "[-0% -2%]",
                  -0.007029375671891979
                ],
                [
                  "[-2% -4%]",
                  -0.026639321998952213
                ],
                [
                  "[-4% -6%]",
                  -0.047340701224977355
                ],
                [
                  "[-6% -8%]",
                  -0.06882447034676904
                ],
                [
                  "[-8% -10%]",
                  -0.0845268156918576
                ],
                [
                  "[-10%+]",
                  -0.13221290755649556
                ]
              ]
            },
            "name": "tail_score",
            "value": 8
          }
        ],
        "overall_score": 5.6,
        "overlay": {
          "tail": 0,
          "rr": 0,
          "rerr": 0
        }
      }
    ],
    "end_date": "2014-06-01",
    "start_date": "2012-06-01"
  },
  "2015-16 Market Selloff": {
    "risk_scores": [
      {
        "score_list": [
          {
            "data": {
              "relative_non_stock_weights": {
                "SHY": 0.3926940639269407,
                "AHHYX": 0.6073059360730594
              },
              "relative_stock_weights": {}
            },
            "name": "concentrated_score",
            "value": 1
          },
          {
            "data": {
              "short_vol_fraction": 1,
              "long_vol_beta": 0,
              "short_vol_beta": 0.075,
              "long_vol_fraction": 0,
              "classifications": {
                "2": 0.3926940639269407,
                "3": 0.6073059360730594
              }
            },
            "name": "volatility_score",
            "value": 4
          },
          {
            "data": {
              "correlation_benchmarks_min": {
                "SPY": 0.8607878300743297,
                "VIX": -0.8219714459889602,
                "GLD": -0.32939261367825007,
                "VNQ": 0.3626705874719546,
                "BND": -0.37698478888984743
              },
              "correlation_benchmarks_mean": {
                "SPY": 0.8929681920946492,
                "VIX": -0.7648684461757917,
                "GLD": -0.16712301160873475,
                "VNQ": 0.6299886347524906,
                "BND": -0.25750214700604157
              },
              "correlation_benchmarks_max": {
                "SPY": 0.9482720310312953,
                "VIX": -0.7180707701830622,
                "GLD": 0.19880664282939325,
                "VNQ": 0.7098215321852273,
                "BND": 0.15705280827936896
              }
            },
            "name": "correlation_score",
            "value": 8
          },
          {
            "data": {
              "median_portfolio_move": [
                [
                  "[-0% -2%]",
                  -0.010323714748607247
                ],
                [
                  "[-2% -4%]",
                  -0.03469457586165013
                ],
                [
                  "[-4% -6%]",
                  -0.06395665996187737
                ],
                [
                  "[-6% -8%]",
                  -0.09702327861823168
                ],
                [
                  "[-8% -10%]",
                  -0.13740675311485964
                ],
                [
                  "[-10%+]",
                  -0.16545972838662798
                ]
              ],
              "worst_market_move": -0.19632559765788316,
              "median_market_move": [
                [
                  "[-0% -2%]",
                  -0.007029375671891979
                ],
                [
                  "[-2% -4%]",
                  -0.026639321998952213
                ],
                [
                  "[-4% -6%]",
                  -0.047340701224977355
                ],
                [
                  "[-6% -8%]",
                  -0.06882447034676904
                ],
                [
                  "[-8% -10%]",
                  -0.0845268156918576
                ],
                [
                  "[-10%+]",
                  -0.13221290755649556
                ]
              ]
            },
            "name": "tail_score",
            "value": 8
          }
        ],
        "overall_score": 6.6,
        "overlay": {
          "tail": 0,
          "rr": 0,
          "rerr": 0
        }
      }
    ],
    "end_date": "2017-01-01",
    "start_date": "2015-01-01"
  },
  "ignored_tickers": []
}
```

-request-type: POST

-request-url: /scores/risks/current

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name                    | Type   | Description                                                                                    |
| ----------------------- | ------ | ---------------------------------------------------------------------------------------------- |
| custom                  | Object | Object containing risks scores, start date and end date                                        |
| Global Financial Crisis | Object | Object containing the simulated risk score of the portfolio during the Global Financial Crisis |
| 2011 Euro Credit Crisis | Object | Object containing the simulated risk score of the portfolio during the 2011 Euro Credit Crisis |
| 2013 Taper Tantrum      | Object | Object containing the simulated risk score of the portfolio during the 2013 Taper Tantrum      |
| 2015-16 Market Selloff  | Object | Object containing the simulated risk score of the portfolio during the 2015-16 Market Selloff  |
| ignored tickers         | Object | List of ignored tickers                                                                        |

`custom, Global Financial Crisis, 2011 Euro Credit Crisis, 2013 Taper Tantrum, 2015-16 Market Selloff` Object

| Name        | Type   | Description                    |
| ----------- | ------ | ------------------------------ |
| risk_scores | Object | Contains the score_list object |

`risk_scores` object

| Name       | Type   | Description                    |
| ---------- | ------ | ------------------------------ |
| score_list | Object | Object containing various data |

`score_list` Object

| Name            | Type   | Description                                                      |
| --------------- | ------ | ---------------------------------------------------------------- |
| data            | Object | Object containing various data                                   |
| overall \_score | float  | The overall score of the portfolio                               |
| overlay         | Object | Object containing score of portfolio with corresponding overlays |

`overlay` Object

| Name | Type  | Description                                                         |
| ---- | ----- | ------------------------------------------------------------------- |
| tail | float | Score of portfolio with a tail overlay                              |
| rr   | float | Score of portfolio with a risk reduction overlay                    |
| rerr | float | Score of portfolio with a return enhancement risk reduction overlay |

#### Overall

> To send request:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/risks/current/overall"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
          "ticker": "CASH",
          "value": 4.3
        },
        {
          "ticker": "ISFCX",
          "value": 42.22
        },
        {
          "ticker": "LCEVX",
          "value": 46.83
        },
        {
          "ticker": "AHHYX",
          "value": 6.65
        }
      ]
    }'
```

> Response Body

```shell
{
    "ignored_tickers": [],
    "scores": [
        {
            "score": "overall_score",
            "value": 8.1,
            "scenario": "Global Financial Crisis"
        },
        {
            "score": "overall_score",
            "value": 7.8,
            "scenario": "2011 Euro Credit Crisis"
        },
        {
            "score": "overall_score",
            "value": 5.6,
            "scenario": "2013 Taper Tantrum"
        },
        {
            "score": "overall_score",
            "value": 6.6,
            "scenario": "2015-16 Market Selloff"
        },
        {
            "score": "overall_score",
            "value": 6.2,
            "scenario": "custom"
        }
    ]
}
```

-request-type: POST

-request-url: /scores/risks/current/overall

**Description**

Computes the overall risk score of your current portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Volatility

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/risks/current/volatility"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

> Response Body

```shell
{
    "ignored_tickers": [],
    "scores": [
        {
            "score": "volatility_score",
            "value": 10,
            "scenario": "Global Financial Crisis"
        },
        {
            "score": "volatility_score",
            "value": 10,
            "scenario": "2011 Euro Credit Crisis"
        },
        {
            "score": "volatility_score",
            "value": 4,
            "scenario": "2013 Taper Tantrum"
        },
        {
            "score": "volatility_score",
            "value": 4,
            "scenario": "2015-16 Market Selloff"
        },
        {
            "score": "volatility_score",
            "value": 7,
            "scenario": "custom"
        }
    ]
}
```

-request-type: POST

-request-url: /scores/risks/current/volatility

**Description**

Computes the volatility risk score of your current portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Tail

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/risks/current/tail"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

> Response Body

```shell
{
    "ignored_tickers": [],
    "scores": [
        {
            "score": "tail_score",
            "value": 8,
            "scenario": "Global Financial Crisis"
        },
        {
            "score": "tail_score",
            "value": 8,
            "scenario": "2011 Euro Credit Crisis"
        },
        {
            "score": "tail_score",
            "value": 8,
            "scenario": "2013 Taper Tantrum"
        },
        {
            "score": "tail_score",
            "value": 8,
            "scenario": "2015-16 Market Selloff"
        },
        {
            "score": "tail_score",
            "value": 8,
            "scenario": "custom"
        }
    ]
}
```

-request-type: POST

-request-url: /scores/risks/current/tail

**Description**

Computes the tail risk score of your current portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Concentrated

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/risks/current/concentrated"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

> Response Body

```shell
{
    "ignored_tickers": [],
    "scores": [
        {
            "score": "concentrated_score",
            "value": 1,
            "scenario": "Global Financial Crisis"
        },
        {
            "score": "concentrated_score",
            "value": 1,
            "scenario": "2011 Euro Credit Crisis"
        },
        {
            "score": "concentrated_score",
            "value": 1,
            "scenario": "2013 Taper Tantrum"
        },
        {
            "score": "concentrated_score",
            "value": 1,
            "scenario": "2015-16 Market Selloff"
        },
        {
            "score": "concentrated_score",
            "value": 1,
            "scenario": "custom"
        }
    ]
}
```

-request-type: POST

-request-url: /scores/risks/current/concentrated

**Description**

Computes the concentrated stock risk score of your current portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Correlation

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/risks/current/correlation"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

> Response Body

```shell
{
    "ignored_tickers": [],
    "scores": [
        {
            "score": "correlation_score",
            "value": 8,
            "scenario": "Global Financial Crisis"
        },
        {
            "score": "correlation_score",
            "value": 5,
            "scenario": "2011 Euro Credit Crisis"
        },
        {
            "score": "correlation_score",
            "value": 5,
            "scenario": "2013 Taper Tantrum"
        },
        {
            "score": "correlation_score",
            "value": 8,
            "scenario": "2015-16 Market Selloff"
        },
        {
            "score": "correlation_score",
            "value": 5,
            "scenario": "custom"
        }
    ]
}
```

-request-type: POST

-request-url: /scores/risks/current/correlation

**Description**

Computes the correlation risk score of your current portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

### Target

This API computes the Risks Scores of your target portfolio

#### Overall

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/risks/target/overall"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

-request-type: POST

-request-url: /scores/risks/target/overall

**Description**

Computes the overall risk score of your target portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Volatility

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/risks/target/volatility"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

-request-type: POST

-request-url: /scores/risks/target/overall/volatility

**Description**

Computes the volatility risk score of your target portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Tail

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/risks/target/tail"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

-request-type: POST

-request-url: /scores/risks/target/tail

**Description**

Computes the tail risk score of your target portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Concentrated

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/risks/target/concentrated"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

-request-type: POST

-request-url: /scores/risks/target/concentrated

**Description**

Computes the concentrated stock risk score of your target portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Correlation

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/risks/target/correlation"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

-request-type: POST

-request-url: /scores/risks/target/correlation

**Description**

Computes the correlation risk score of your target portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

## Returns

The Returns Scores describes the potentials returns your portfolio could reap from the various events.

### Current

This API computes the Returns Scores of your current portfolio

#### Overall

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/returns/current/overall"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

-request-type: POST

-request-url: /scores/returns/current/overall

**Description**

Computes the overall returns score of your current portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Volatility

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/returns/current/volatility"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

> Response Body

```shell
{
    "ignored_tickers": [],
    "scores": [
        {
            "score": "volatility_score",
            "value": 10,
            "scenario": "Global Financial Crisis"
        },
        {
            "score": "volatility_score",
            "value": 10,
            "scenario": "2011 Euro Credit Crisis"
        },
        {
            "score": "volatility_score",
            "value": 4,
            "scenario": "2013 Taper Tantrum"
        },
        {
            "score": "volatility_score",
            "value": 4,
            "scenario": "2015-16 Market Selloff"
        },
        {
            "score": "volatility_score",
            "value": 7,
            "scenario": "custom"
        }
    ]
}
```

-request-type: POST

-request-url: /scores/returns/current/volatility

**Description**

Computes the volatility returns score of your current portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Tail

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/returns/current/tail"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

-request-type: POST

-request-url: /scores/returns/current/tail

**Description**

Computes the tail returns score of your current portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Concentrated

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/returns/current/concentrated"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

-request-type: POST

-request-url: /scores/returns/current/concentrated

**Description**

Computes the concentrated stock returns score of your current portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Correlation

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/returns/current/correlation"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

-request-type: POST

-request-url: /scores/returns/current/correlation

**Description**

Computes the correlation returns score of your current portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

### Target

This API computes the Returns Scores of your target portfolio

#### Overall

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/returns/target/overall"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

-request-type: POST

-request-url: /scores/returns/target/overall

**Description**

Computes the overall returns score of your target portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Volatility

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/returns/target/volatility"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

-request-type: POST

-request-url: /scores/returns/target/overall/volatility

**Description**

Computes the volatility returns score of your target portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Tail

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/returns/target/tail"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

-request-type: POST

-request-url: /scores/returns/target/tail

**Description**

Computes the tail returns score of your target portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Concentrated

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/returns/target/concentrated"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

-request-type: POST

-request-url: /scores/returns/target/concentrated

**Description**

Computes the concentrated stock returns score of your target portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |

#### Correlation

> To compute, use this code:

```shell
curl "https://backend.stratifi.com/api/v1/prism/scores/returns/target/correlation"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{
      "positions": [
        {
            "ticker": "CASH",
            "value": 4.3
          },
          {
            "ticker": "ISFCX",
            "value": 42.22
          },
          {
            "ticker": "LCEVX",
            "value": 46.83
          },
          {
            "ticker": "AHHYX",
            "value": 6.65
          }
        ]
      }'
```

-request-type: POST

-request-url: /scores/returns/target/correlation

**Description**

Computes the correlation returns score of your target portfolio

**Request Parameters**

| Parameter | Type   | Description                |
| --------- | ------ | -------------------------- |
| positions | Object | Positions of the portfolio |

`positions` Object

| Name   | Type   | Description                                |
| ------ | ------ | ------------------------------------------ |
| ticker | string | The ticker symbol of the security          |
| value  | float  | The value of the position for the security |

**Response Fields**

| Name            | Type   | Description                            |
| --------------- | ------ | -------------------------------------- |
| ignored_tickers | Object | List of ignored tickers                |
| scores          | Object | The overall score of various scenarios |

`scores` Object

| Name     | Type   | Description                                   |
| -------- | ------ | --------------------------------------------- |
| score    | string | Score type                                    |
| value    | float  | Score of portfolio for corresponding scenario |
| scenario | string | A particular scenario                         |

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section

| Code       | Meaning                                                     |
| ---------- | ----------------------------------------------------------- |
| Error Code | Standard meaning -- followed by explanation in layman terms |
