Given(/^I am on Login page$/) do
  @driver.navigate.to 'http://demo.redmine.org/my/account/'
end

When(/^I submit (not )?valid credentials "([^"]*)"\/"([^"]*)"$/) do |_,login, password|
  @wait.until {@driver.find_element(id:'username').displayed?}
  @driver.find_element(id:'username').send_keys login
  @driver.find_element(id:'password').send_keys password
  @driver.find_element(name:'login').click
end

Then(/^I am logged in as asdf$/) do
  @wait.until {@driver.find_element(id:'loggedas').displayed?}
  expect(@driver.find_element(id:'loggedas').text).not_to be_nil
end

Then(/^there is a error message "([^"]*)"$/) do |message|
  @wait.until {@driver.find_element(id:'flash_error').displayed?}
  expect(@driver.find_element(id:'flash_error').text).to eql message
end
