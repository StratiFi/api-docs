# Changelog

- 1.13.0 (2024-07-08)
  - Modify `sources` field in `household`, `investor`, `account` and `model_portfolio`, now returns an object with the fields `id`, `provider`, `provider_id`, `created` and `modified`.
  - Add `source_id` and `source_provider` filters to `household`, `investor`, `account` and `model_portfolio`.
  - Adds `teams` field to `model_portfolio` and `account`.
- 1.12.0 (2024-06-20)
  - Add sources field to `household`, `investor`, `account` and `model_portfolio`
- 1.11.0 (2024-05-21)
  - Add `/teams/` endpoint
- 1.10.0 (2023-03-27)
  - Add `quantity`, `price`, `units` and `cost_basis` fields to the account positions.
- 1.9.0 (2023-03-27)
  - Remove `risk`, `tolerance` and `drift` attributes from the advisor list and detail.
  - Remove `/advisors/<id>/prism_aggregation/` endpoint.
  - Add `/advisors/stats/` and `/advisors/<id>/stats/` endpoints
- 1.8.0 (2023-02-28)
  - Allow setting model portfolios as strategies.
- 1.7.0 (2022-11-22)
  - Allow Proof Key for Code Exchange.
- 1.6.1 (2022-03-19)
  - Fix accepted values for tax status
- 1.6.0
  - Enhance the risk and tolerance objects with score factors and media.
- 1.5.1
  - Remove restrictions to the account type field.
- 1.5.0
  - Add tax status field to accounts
  - Add strategy field to accounts
  - Fix /o/token/ examples
- 1.4.0
  - Add the aggregated risk, tolerance and drift to the investor, household and advisor.
- 1.3.0
  - Add userinfo endpoint
- 1.2.0
  - Add security endpoints
- 1.1.0
  - Add oauth endpoints
