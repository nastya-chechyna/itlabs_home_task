Feature: Change password

  I want to be able to change password

  @change_password
  Scenario: Positive case to change password
    Given I am on Setings page
    When I change my old password to new
    Then I see the message "Password was successfully updated."


@create_new_bug

  Scenario: Positive test to create new bug
    Given I am on Issue tab
    When I create new isuue with Bug type
    Then I see notice started with 'Bug'
