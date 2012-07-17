Feature: Pure market orders

  Scenario: Market buy order fully matches with best limit order
    Given the following orders are submitted in this order:
      | Broker | Side | Quantity | Order Type  | Price |
      | A      | Sell | 100      | Limit       | 10.2  |
      | B      | Sell | 100      | Limit       | 10.2  |
      | C      | Buy  | 100      | MarketOrder |       |

  Scenario: Trading Session Example 1
    Given the following orders are submitted in this order:
      | Broker | Side | Quantity | Order Type  | Price |
      | A      | Sell | 100      | Limit       | 10.2  |
      | B      | Sell | 60       | Limit       | 10.3  |
      | C      | Buy  | 110      | MarketOrder |       |
    Then the following trades are generated:
      | Buying broker | Selling broker | Quantity | Price |
      | C             | A              | 100      | 10.2  |
      | C             | B              | 10       | 10.3  |
    Then remaining buy order book depth is 0
    And remaining sell order book depth is 1

  Scenario: Trading Session Example 2
    Given the following orders are submitted in this order:
      | Broker | Side | Quantity | Order Type  | Price |
      | A      | Sell | 100      | Limit       | 10.2  |
      | B      | Sell | 60       | Limit       | 10.3  |
      | C      | Buy  | 200      | MarketOrder |       |
    Then the following trades are generated:
      | Buying broker | Selling broker | Quantity | Price |
      | C             | A              | 100      | 10.2  |
      | C             | B              | 60       | 10.3  |
    Then remaining buy order book depth is 1
    And remaining sell order book depth is 0