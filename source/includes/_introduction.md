# Introduction

Welcome to the StratiFi API! You can use our API to access StratiFi's API endpoints, which allow you to review your portfolio and get information on various risks and scores.

Code examples will be presented in the dark area to the right.

StratiFi's API follows an architecture, where HTTP methods define the action to perform and the endpoint URL determines the object(s) scope. Standard HTTP response codes describe the result of the operations in our API.

## Requests

All requests should use the Hypertext Transfer Protocol Secure (HTTPS).

StratiFi's API domain name is: `backend.stratifi.com`.

You can also start testing using our sandbox hosted in `sandbox.stratifi.com`

## Authentication

We use API keys to allow access to the API endpoints. The current Authentication method is Bearer token, provided by StratiFi Team. StratiFi expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer stratifi-token`

<aside class="notice">
You must replace <code>stratifi-token</code> with your personal API key.
</aside>
