Feature: The orders service back-end
    As a API user
    I need a RESTful catalog service
    So that I can keep track of all orders

Background:
    Given the following pets
        | id | customer_name       | amount_paid |  
        |  1 | fido                | dog         |
        |  2 | kitty               | cat         |
        |  3 | leo                 | lion        |

Scenario: The server is running
    When I visit the "home page"
    Then I should see "Orders Demo REST API Service"
    Then I should not see "404 Not Found"

Scenario: List all orders
    When I visit "/orders"
    Then I should see "fido"
    And I should see "kitty"
    And I should see "leo"

Scenario: Update a order
    When I retrieve "/orders" with id "1"
    And I change "amount_paid" to "big dog"
    And I update "/orders" with id "1"
    Then I should see "big dog"

Scenario: Delete a order
    When I visit "/orders"
    Then I should see "fido"
    And I should see "kitty"
    When I delete "/orders" with id "2"
    And I visit "/orders"
    Then I should see "fido"
    And I should not see "kitty"
