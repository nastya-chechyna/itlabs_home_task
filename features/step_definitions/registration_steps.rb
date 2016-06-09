Given(/^I am on register page$/) do
  @driver.navigate.to 'http://demo.redmine.org/account/register'
end

When(/^I submit registration form with valid data$/) do
  register_user
end

Then(/^I see message "([^"]*)"$/) do |message|
  @wait.until {@driver.find_element(:id, 'flash_notice').displayed?}
  expect(@driver.find_element(:id, 'flash_notice').text).to eql message
end

And(/^I am logged in$/) do
  current_login= @driver.find_element(:css, '#loggedas .user').text
  expect(current_login).to eql @login
end
