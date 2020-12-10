# Introduction

Welcome to the StratiFi API! You can use our API to access StratiFi's API endpoints, which allow you to review your portfolio and get information on various risks and scores.

Code examples will be presented in the dark area to the right.

If you are familiar with Postman, you can import <a href="https://www.getpostman.com/collections/9e82bcf47798dacdbb8c" target="_blank">this collection</a> and play with the API.

## Architecture

StratiFi's API follows a REST architecture, where HTTP methods define the action to perform and the endpoint URL determines the object(s) scope. The result of the operations is well described by standard HTTP response codes.

## Requests

All requests should use the Hypertext Transfer Protocol Secure (HTTPS).

StratiFi's API domain name is: `backend.stratifi.com`.

You can also start testing using our sandbox hosted in `sandbox.stratifi.com`

## Authentication

We use API keys to allow access to the API endpoints. The current Authentication method is Bearer token, provided by StratiFi Team. StratiFi expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer stratifi-token`

<aside class="notice">
You must replace <code>stratifi-token</code> with your API key.
</aside>

## Content Structure

StratiFi's portfolios are stored in a hierarchical structure: Companies are at the top level and positions at the bottom level. Also, each object is linked to another in the upper level, for instance, an account has an `investor_id` attribute that contains the ID of the investor that owns that account.

Company ⟶ Advisor ⟶ Household \* ⟶ Investor ⟶ Account ⟶ Position

Company ⟶ Model Portfolio ⟶ Position

(\*) Households are optional. An investor could be linked directly to the advisor.

## Filtering

You can filter objects returned by an endpoint using URL params. Each section describes the allowed **Filtering Fields** in that endpoint.

For instance, if you need to the accounts of the investor with ID 31 you can use `/api/v1/accounts/?investor=31`.
