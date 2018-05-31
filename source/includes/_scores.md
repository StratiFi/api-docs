# Score
The PRISM API allows you to compute two types of scores. Risks and Returns.

## Risks
The Risks Scores describes the susceptibility of your portfolio to the various events. 
### Current
This API computes the Risks Scores of your current portfolio
#### Overall
> To compute, use this code: 

```shell
# With shell, you can just pass the correct header with each request
curl "api.stratifi.com/v1/scores/risks/current/overall"
  -H "Authorization: stratifi-token"
```

-request-type: POST

-request-url: /scores/risks/current/overall

**Description**

Computes the overall risk score of your current portfolio

#### Volatility
-request-type: POST

-request-url: /scores/risks/current/volatility

**Description**

Computes the volatility risk score of your current portfolio

#### Tail
-request-type: POST

-request-url: /scores/risks/current/tail

**Description**

Computes the tail risk score of your current portfolio

#### Concentrated
-request-type: POST

-request-url: /scores/risks/current/concentrated

**Description**

Computes the concentrated stock risk score of your current portfolio

#### Correlation
-request-type: POST

-request-url: /scores/risks/current/correlation

**Description**

Computes the correlation risk score of your current portfolio

### Target
This API computes the Risks Scores of your target portfolio
#### Overall
-request-type: POST

-request-url: /scores/risks/target/overall

**Description**

Computes the overall risk score of your target portfolio

#### Volatility
-request-type: POST

-request-url: /scores/risks/target/overall/volatility

**Description**

Computes the volatility risk score of your target portfolio

#### Tail
-request-type: POST

-request-url: /scores/risks/target/tail

**Description**

Computes the tail risk score of your target portfolio

#### Concentrated
-request-type: POST

-request-url: /scores/risks/target/concentrated

**Description**

Computes the concentrated stock risk score of your target portfolio

#### Correlation
-request-type: POST

-request-url: /scores/risks/target/correlation

**Description**

Computes the correlation risk score of your target portfolio


## Returns
The Returns Scores describes the potentials returns your portfolio could reap from the various events. 
### Current
blah blah blah
#### Overall
blah blah blah
#### Volatility
blah blah blah
#### Tail
blah blah blah
#### Concentrated
blah blah blah
#### Correlation
blah blah blah
### Target
blah blah blah
#### Overall
blah blah blah
#### Volatility
blah blah blah
#### Tail
blah blah blah
#### Concentrated
blah blah blah
#### Correlation
blah blah blah
