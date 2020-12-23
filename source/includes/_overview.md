# API Overview

Our API follows a REST pattern, where HTTP methods define the action to perform and the endpoint URL determines the object(s) scope.

| HTTP method | Usage                                                                          |
| ----------- | ------------------------------------------------------------------------------ |
| GET         | List objects or Retrieve a particular object if the ID is provided in the URL. |
| POST        | Create object.                                                                 |
| PUT         | Update entire object.                                                          |
| PATCH       | Update only the provided attributes.                                           |
| DELETE      | Delete object.                                                                 |

The result of the operations is well described by standard HTTP response codes.

| HTTP response code | Description                                                                                                                  |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------- |
| 20x                | Success                                                                                                                      |
| 30x                | Resource moved                                                                                                               |
| 400                | Bad Request -- Your request is invalid.                                                                                      |
| 401                | Unauthorized -- Your API key is wrong.                                                                                       |
| 403                | Forbidden -- The resource requested is hidden for administrators only.                                                       |
| 404                | Not Found -- The specified resource could not be found.                                                                      |
| 405                | Method Not Allowed -- You tried to access a uri with an invalid method.                                                      |
| 429                | Too Many Requests -- You're making too many requests. Please allow some time for our server to serve your previous requests. |
| 500                | Internal Server Error -- We had a problem with our server. Try again later.                                                  |
| 503                | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.                                    |

The StratiFi API uses the following error codes:

## Domain

We offer a sandbox where you can test safely: `https://sandbox.stratifi.com`

Once you are ready, you will get access to the production domain `https://backend.stratifi.com`

## Filtering

You can filter objects returned by an endpoint using URL params. Each section describes the allowed **Filtering Fields** in that endpoint.

For instance, if you want to list the accounts of the investor with ID 31 you can use `/api/v1/accounts/?investor=31`.
