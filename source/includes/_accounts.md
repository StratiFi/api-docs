# Accounts

All accounts related endpoints

## Get All Accounts

Gets all accounts

> To send request:

```shell
curl "api.stratifi.com/v1/accounts/"
  -H "Authorization: stratifi-token"
```

> Reponse Body

```shell
{
    "count": 9,
    "next": null,
    "previous": null,
    "results": [
        {
            "id": 13272,
            "provider": 0,
            "name": "testing account post2",
            "value": 1100,
            "data": null,
            "non_taxable": false,
            "portfolio_margin": false,
            "status": 1,
            "updated_at": "2018-06-07T12:04:09.780358",
            "created_at": "2018-06-06T15:57:38.716544",
            "type": null,
            "doc_type": null,
            "number": null,
            "performance_validated": false,
            "pending_overlay_changes": false,
            "investor": null,
            "advisor_account": null,
            "owner": 3591,
            "execution_client": null,
            "strategies": []
        }, … ]
}
```

-request-type: GET

-request-url: /accounts

**Response Fields**

Name | Type | Description
-----|------|------------
count | int | Number of accounts
next | String | Link to next page of accounts
previous | String | Link to previous page of accounts
results | Object | List of Account objects

`results` Object

Name | Type | Description
-----|------|------------
id | int | ID of account in StratiFi's system
provider | int | ID of data provider recorded in StratiFi's system
name | String | Name of account
value | float | Portfolio value of account
data | Object | Object representing the Account object
non_taxable | boolean | True if account is taxable
portfolio_margin | boolean | True if portfolio margin policy was applied to account
status | int | ID of account status
updated_at | Timestamp | Last updated timestamp
created_at | Timestamp | Created at timestamp
type | int | Account type
doc_type | int | Document type signed for creation of this account
number | int | Finfolio Account Number
performance_validated | boolean | True if performance has been validated by StratiFi's strict autonamous script
pending_overlay_changes | boolean | True if there are pending overlay changes to the account
investor | Object | Object describing the investor whom the account belongs to
advisor_account | Object | Object describing the advisor of this account
owner | int | ID of the user who created the object
execution_client | Object | Object describing the execution client at custodian
strategies | Object | List of strategies the account is subscribed to

## Get Account By ID

Get account by ID

-request-type: GET

-request-url: /accounts/:ID

## Create Account

Create an account

-request-type: POST

-request-url: /accounts

> To send request:

```shell
curl -X POST "api.stratifi.com/v1/accounts/"
  -H "Authorization: stratifi-token"
  -H "Content-Type: application/json"
  -d '{"name": "new_account"}'
```

> Reponse Body

```shell
{
    "id": 15098,
    "provider": 0,
    "name": "new_account",
    "value": 0.0,
    "data": null,
    "non_taxable": false,
    "portfolio_margin": false,
    "status": 1,
    "updated_at": "2018-08-27T12:42:15.478899",
    "created_at": "2018-08-27T12:42:15.478913",
    "type": null,
    "doc_type": null,
    "number": null,
    "investor": null,
    "advisor_account": null,
    "owner": 357,
    "execution_client": null,
    "strategies": []
}
```

**Request Parameters**

Parameter | Type | Description
----------|------|------------
name | String | Name of account
provider | int | (optional) ID of data provider recorded in StratiFi's system
non_taxable | boolean | (optional) True if account is taxable
portfolio_margin | boolean | (optional) True if portfolio margin policy was applied to account
status | int | (optional) ID of account status
type | int | (optional) Account type
doc_type | int | (optional) Document type signed for creation of this account
number | int | (optional) Finfolio Account Number
investor | int | (optional) ID of investor whom the account belongs to
advisor_account | int | (optional) ID of advisor of this account
execution_client | int | (optional) ID of the execution client at custodian

**Valid Account Types**

Value | Description
----------|------
100 | Individual
101 | Joint
200 | Revocable Living Trust
201 | Irrevocable Living Trust
300 | Limited Liability Company
304 | Limited Liability Limited Partnership
301 | S Corporation
302 | C Corporation
303 | Sole Proprietorship
400 | Traditional IRA
402 | Simplified Employee Pension IRA
402 | Savings Incentive Match Plan for Employees IRA
403 | Roth IRA
404 | Rollover IRA
500 | Household Account


## Update Account

Update account information

-request-type: PUT

-request-url: /accounts/:ID

**Parameters**

Parameter | Type | Description
----------|------|------------
name | String | Name of account
provider | int | ID of data provider recorded in StratiFi's system
non_taxable | boolean | True if account is taxable
portfolio_margin | boolean | True if portfolio margin policy was applied to account
status | int | ID of account status
type | int | Account type
doc_type | int | Document type signed for creation of this account
number | int | Finfolio Account Number
investor | int | ID of investor whom the account belongs to
advisor_account | int | ID of advisor of this account
execution_client | int | ID of the execution client at custodian

## List All PRISM Scores

List all PRISM Scores of all accounts

-request-type: GET

-request-url: /accounts/prism-scores

## Batch Update Accounts PRISM Score

Update PRISM Score of accounts in batch

-request-type: POST

-request-url: /accounts/update_prism_scores/

> To send request:

```shell
curl -X POST "api.stratifi.com/accounts/update_prism_scores/"
  -H "Authorization: stratifi-token"
  -H 'Content-Type: application/json'
  -d '{"account_ids": [1, 2, 3, 4]}'
```

> Reponse Body

```shell
{
    "version":"1",
    "data": {
        "task_id": "da9df77e-1234-4957-5678-3caa77a501d2"
    }
}
```


**Response Fields**

Name | Type | Description
-----|------|------------
task_id | int | The async task ID


## Update PRISM Score

Update account PRISM Score


-request-type: POST

-request-url: /accounts/:ID/update_prism_score/
