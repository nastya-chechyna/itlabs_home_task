Feature: Registration

  As a registered user
  I want to be able to register

  @registration
  Scenario: Positive registration
    Given I am on register page
    When I submit registration form with valid data
    Then I see message "Your account has been activated. You can now log in."
    And I am logged in