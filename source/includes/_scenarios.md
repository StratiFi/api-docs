# Scenarios

Get details of various scenarios used in PRISM

> To send request:

```shell
> curl "https://backend.stratifi.com/api/v1/prism/scenarios"
  -H "Authorization: Bearer {{ access-token }}"
```

> Reponse Body

```shell
[
    {
        "overlay_coverage": [
            {
                "tail": 0,
                "rr": 0,
                "rerr": 0
            }
        ],
        "name": "Global Financial Crisis",
        "end_date": "2009-2-1",
        "start_date": "2007-2-1"
    },
    {
        "overlay_coverage": [
            {
                "tail": 0,
                "rr": 0,
                "rerr": 0
            }
        ],
        "name": "2011 Euro Credit Crisis",
        "end_date": "2012-1-1",
        "start_date": "2010-1-1"
    },
    {
        "overlay_coverage": [
            {
                "tail": 0,
                "rr": 0,
                "rerr": 0
            }
        ],
        "name": "2013 Taper Tantrum",
        "end_date": "2014-6-1",
        "start_date": "2012-6-1"
    },
    {
        "overlay_coverage": [
            {
                "tail": 0,
                "rr": 0,
                "rerr": 0
            }
        ],
        "name": "2015-16 Market Selloff",
        "end_date": "2017-1-1",
        "start_date": "2015-1-1"
    },
    {
        "overlay_coverage": [
            {
                "tail": 0,
                "rr": 0,
                "rerr": 0
            }
        ],
        "name": "custom",
        "end_date": "2018-06-13",
        "start_date": "2005-1-1"
    }
]
```

-request-type: GET

-request-url: /scenarios

**Response Fields**

| Name             | Type   | Description                           |
| ---------------- | ------ | ------------------------------------- |
| overlay_coverage | Object | The overlay coverage of this scenario |
| name             | string | Scenario name                         |
| end_date         | string | Start date of scenario                |
| start_Date       | string | End date of scenario                  |

`overlay_coverage` Object

| Name | Type  | Description                                     |
| ---- | ----- | ----------------------------------------------- |
| tail | float | Tail overlay value                              |
| rr   | float | Risk reduction overlay value                    |
| rerr | float | Return enhancement risk reduction overlay value |
