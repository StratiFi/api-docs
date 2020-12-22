# About

## StratiFi

You can think about data in StratiFi as a hierarchical structure where a companies are at the higher level and accounts at the bottom level.

![Company ⟶ Advisor ⟶ Household * ⟶ Investor ⟶ Account](https://s3.amazonaws.com/api.stratifi.com/data2.2.png "StratiFi Data")

Each object is linked to another in the upper level, for instance, an account has an `investor_id` attribute that contains the ID of the investor that owns that account.

(\*) Households are optional. An investor can be linked directly to the advisor.
