# Score
The PRISM API allows you to compute two types of scores. Risks and Returns.

## Risks
The Risks Scores describes the susceptibility of your portfolio to the various events. 
### Current
This API computes the Risks Scores of your current portfolio
#### Overall
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/risks/current/overall"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/risks/current/overall", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/risks/current/overall"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/risks/current/overall

**Description**

Computes the overall risk score of your current portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Volatility
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/risks/current/volatility"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/risks/current/volatility", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/risks/current/volatility"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/risks/current/volatility

**Description**

Computes the volatility risk score of your current portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Tail
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/risks/current/tail"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/risks/current/tail", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/risks/current/tail"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/risks/current/tail

**Description**

Computes the tail risk score of your current portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Concentrated
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/risks/current/concentrated"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/risks/current/concentrated", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/risks/current/concentrated"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/risks/current/concentrated

**Description**

Computes the concentrated stock risk score of your current portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Correlation
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/risks/current/correlation"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/risks/current/correlation", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/risks/current/correlation"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/risks/current/correlation

**Description**

Computes the correlation risk score of your current portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

### Target
This API computes the Risks Scores of your target portfolio
#### Overall
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/risks/target/overall"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/risks/target/overall", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/risks/target/overall"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/risks/target/overall

**Description**

Computes the overall risk score of your target portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Volatility
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/risks/target/volatility"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/risks/target/volatility", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/risks/target/volatility"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/risks/target/overall/volatility

**Description**

Computes the volatility risk score of your target portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Tail
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/risks/target/tail"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/risks/target/tail", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/risks/target/tail"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/risks/target/tail

**Description**

Computes the tail risk score of your target portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Concentrated
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/risks/target/concentrated"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/risks/target/concentrated", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/risks/target/concentrated"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/risks/target/concentrated

**Description**

Computes the concentrated stock risk score of your target portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Correlation
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/risks/target/correlation"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/risks/target/correlation", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/risks/target/correlation"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/risks/target/correlation

**Description**

Computes the correlation risk score of your target portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms


## Returns
The Returns Scores describes the potentials returns your portfolio could reap from the various events. 
### Current
This API computes the Returns Scores of your current portfolio
#### Overall
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/returns/current/overall"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/returns/current/overall", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/returns/current/overall"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/returns/current/overall

**Description**

Computes the overall returns score of your current portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Volatility
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/returns/current/volatility"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/returns/current/volatility", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/returns/current/volatility"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/returns/current/volatility

**Description**

Computes the volatility returns score of your current portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Tail
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/returns/current/tail"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/returns/current/tail", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/risks/returns/tail"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/returns/current/tail

**Description**

Computes the tail returns score of your current portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Concentrated
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/returns/current/concentrated"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/returns/current/concentrated", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/returns/current/concentrated"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/returns/current/concentrated

**Description**

Computes the concentrated stock returns score of your current portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Correlation
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/returns/current/correlation"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/returns/current/correlation", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/returns/current/correlation"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/returns/current/correlation

**Description**

Computes the correlation returns score of your current portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

### Target
This API computes the Returns Scores of your target portfolio
#### Overall
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/returns/target/overall"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/returns/target/overall", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/returns/target/overall"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/returns/target/overall

**Description**

Computes the overall returns score of your target portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Volatility
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/returns/target/volatility"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/returns/target/volatility", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/returns/target/volatility"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/returns/target/overall/volatility

**Description**

Computes the volatility returns score of your target portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Tail
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/returns/target/tail"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/returns/target/tail", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/returns/target/tail"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/returns/target/tail

**Description**

Computes the tail returns score of your target portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Concentrated
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/returns/target/concentrated"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/returns/target/concentrated", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/returns/target/concentrated"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/returns/target/concentrated

**Description**

Computes the concentrated stock returns score of your target portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms

#### Correlation
> To compute, use this code: 

```shell
curl "api.stratifi.com/v1/scores/returns/target/correlation"
  -H "Authorization: stratifi-token"
```

```python
import requests

score = requests.post("api.stratifi.com/v1/scores/returns/target/correlation", 
					  header={"Authorization": "stratifi-token"}, 
					  data={"Some para": "para"})
```

```javascript
const xhttp = new XMLHttpRequest();
const uri = "api.stratifi.com/v1/scores/returns/target/correlation"
const data = {
	"Some para": "para"
}

xhttp.open("POST", uri, true);
xhttp.setRequestHeader("Content-type", "application/json");
xhttp.send(data)
```

-request-type: POST

-request-url: /scores/returns/target/correlation

**Description**

Computes the correlation returns score of your target portfolio

**Request Data**

Parameter | Type | Default | Description
----------|------|---------|------------
Some para | String | para | This is the description to the parameter

**Error**

This section describes some common errors you might encountered specifiic to this endpoint. For general errors, please look at the [Errors](#errors) section 

Code | Meaning
-----------|--------
Error Code | Standard meaning -- followed by explanation in layman terms
