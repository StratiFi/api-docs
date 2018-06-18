# Accounts

All accounts related endpoints

## Get All Accounts

Gets all accounts

> To send request:

```shell
curl "api.stratifi.com/v1/accounts"
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
type | I don't remember what is this | I don't remember what is this
doc_type | String | Document type signed for creation of this account
number | int | Finfolio Account Number
performance validated | boolean | True if performance has been validated by StratiFi's strict autonamous script 
pending_overlay_changes | boolean | True if there are pending overlay changes to the account
investor | Object | Object describing the investor whom the account belongs to
advisor_account | Object | Object describing the advisor of this account
owner | I don't remember this | I don't remember this
execution_client | Object | Object describing the execution client at custodian
strategies | Object | List of strategies the account is subscribed to

## Get Account By Name

Get account by name

-request-type: POST

-request-url: /accounts

## Get Account By ID

Get account by ID

-request-type: POST

-request-url: /accounts/:ID

## Update Positions

Update account with new positions

-request-type: PUT

-request-url: /accounts/:ID

## List All PRISM Scores

List all PRISM Scores of all accounts

-request-type: GET

-request-url: /accounts/prism-scores

