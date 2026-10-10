# Surveillance Exceptions

Surveillance exceptions are the monitoring alerts StratiFi raises on accounts, investors and households: drift, share class, cash concentration, portfolio concentration, trading activity and IPS drift. They are **read-only** through the API.

You see the same exceptions as in the StratiFi app: an advisor token sees the exceptions on the accounts, investors and households visible to that advisor; an API-user token sees the exceptions on the objects it owns.

## Surveillance Exception object definition

> Surveillance Exception Object

```shell
{
    "id": 81234,
    "cause": "share_class",
    "cause_id": 2,
    "status": "to_do",
    "status_changed": "2026-10-01T06:00:00Z",
    "target_type": "account",
    "target_type_id": 38,
    "target_id": 51234,
    "trigger_type": "position",
    "trigger_type_id": 41,
    "trigger_id": 98213,
    "extra_data": {"newest_position_data": {…}},
    "created": "2026-10-01T06:00:00Z",
    "modified": "2026-10-01T06:00:00Z",
    "start": "2026-10-01T06:00:00Z",
    "end": null,
    "age": 9,
    "snoozed_until": null
}
```

| Name            | Type     | Description                                                                                                                         |
|-----------------|----------|-------------------------------------------------------------------------------------------------------------------------------------|
| id              | int      | Surveillance exception ID                                                                                                           |
| cause           | string   | One of [these causes](#surveillance-exception-causes)                                                                               |
| cause_id        | int      | Numeric id of the cause                                                                                                             |
| status          | string   | One of [these statuses](#surveillance-exception-statuses)                                                                           |
| status_changed  | datetime | When the status last changed                                                                                                        |
| target_type     | string   | Kind of object the exception is on: `account`, `investor` or `household`                                                            |
| target_type_id  | int      | Numeric id of that kind of object. It differs between environments; use `target_type` in your logic                                 |
| target_id       | int      | ID of the [account](#accounts), [investor](#investors) or [household](#households)                                                  |
| trigger_type    | string   | Kind of object that triggered it: `position` for share class exceptions (see [positions](#positions)), otherwise the target itself |
| trigger_type_id | int      | Numeric id of that kind of object. It differs between environments; use `trigger_type` in your logic                                |
| trigger_id      | int      | ID of the triggering object                                                                                                         |
| extra_data      | object   | Cause-specific metrics recorded when the exception was raised                                                                       |
| created         | datetime | When the exception was created                                                                                                      |
| modified        | datetime | When the exception was last changed                                                                                                 |
| start           | datetime | When the exception opened                                                                                                           |
| end             | datetime | When it was snoozed, resolved or closed; `null` while open                                                                          |
| age             | int      | Days open (from `start` to `end`, or to now while open)                                                                             |
| snoozed_until   | datetime | When a snoozed exception returns to `to_do`; `null` otherwise                                                                       |

### Surveillance Exception causes

| cause                   | cause_id |
|-------------------------|----------|
| drift                   | 1        |
| share_class             | 2        |
| cash_concentration      | 3        |
| portfolio_concentration | 4        |
| trading_activity        | 5        |
| ips_drift               | 6        |

### Surveillance Exception statuses

| status      | Description                                                    |
|-------------|----------------------------------------------------------------|
| to_do       | Open, not yet worked on                                        |
| in_progress | Open, an advisor is working on it                              |
| snoozed     | Open, hidden until `snoozed_until`                             |
| resolved    | Finished by StratiFi: the object is healthy again              |
| closed      | Finished by an advisor, who dismissed it                       |

## List surveillance exceptions

> List Surveillance Exceptions

```shell
curl "https://backend.stratifi.com/api/v1/surveillance-exceptions/?status=to_do,in_progress&target_type=account" \
  -H "Authorization: Bearer {{ access-token }}"
```

```shell
{
    "count": 42,
    "next": "https://backend.stratifi.com/api/v1/surveillance-exceptions/?page=2&status=to_do,in_progress&target_type=account",
    "previous": null,
    "total_pages": 3,
    "results": [
        {...Surveillance Exception Object},
        {...Surveillance Exception Object}
    ]
}
```

-request-type: GET

-request-url: `/surveillance-exceptions/`

Results are paginated: `page` and `page_size` (default 20, at most 100). There is no option to return every result at once.

**Response Fields**

| Name        | Type        | Description                                                                |
|-------------|-------------|----------------------------------------------------------------------------|
| count       | int         | Total number of exceptions                                                 |
| next        | string      | Link to the next page                                                      |
| previous    | string      | Link to the previous page                                                  |
| total_pages | int         | Number of pages                                                            |
| results     | object list | List of [surveillance exception objects](#surveillance-exception-object-definition) |

**Filtering Fields**

| Name                                          | Type     | Description                                                                               |
|-----------------------------------------------|----------|-------------------------------------------------------------------------------------------|
| status                                        | string   | One or more statuses, comma separated (`to_do,in_progress,snoozed` are the open ones)     |
| target_type                                   | string   | `account`, `investor` or `household`                                                      |
| target_id                                     | int      | ID of the target (use with `target_type`)                                                 |
| trigger_type                                  | string   | `account`, `investor`, `household` or `position`                                          |
| trigger_id                                    | int      | ID of the trigger (use with `trigger_type`)                                               |
| created_after, created_before                 | datetime | Created at or after / at or before (ISO 8601)                                             |
| start_after, start_before                     | datetime | Opened at or after / at or before                                                         |
| end_after, end_before                         | datetime | Finished at or after / at or before                                                       |
| status_changed_after, status_changed_before   | datetime | Status changed at or after / at or before                                                 |
| ordering                                      | string   | `id`, `created`, `modified`, `status_changed`, `start`, `end` or `age`; prefix `-` for descending. Default `-id` (newest first) |

An unknown `status`, `target_type` or `trigger_type` value is rejected with a `400`.

## Get surveillance exception by id

> Get Surveillance Exception by id

```shell
curl "https://backend.stratifi.com/api/v1/surveillance-exceptions/81234/" \
  -H "Authorization: Bearer {{ access-token }}"
```

-request-type: GET

-request-url: `/surveillance-exceptions/<exception_id>/`

Returns a [surveillance exception object](#surveillance-exception-object-definition), or `404` when it does not exist or is not visible to you.
