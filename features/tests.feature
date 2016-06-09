Feature: Login

    As a user
    I want to be able to login
    And to see an error message in case I made a mistakes

    Background: on Login page
        Given I am on Login page
  @positive
    Scenario: Positive Login
      When I submit valid credentials "asdf"/"asdf"
      Then I am logged in
  @negative
    Scenario Outline: Negative Login
      When I submit not valid credentials "<login>"/"<password>"
      Then there is a error message "<message>"

       Examples:
        | login | password | message                  |
        |       |          | Invalid user or password |
        | qqqqq |          | Invalid user or password |
        |       | qqqqqq   | Invalid user or password |
        | qqqqq | qqqqqq   | Invalid user or password |

