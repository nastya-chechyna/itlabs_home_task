
Given(/^I am on Setings page$/) do
  @driver.navigate.to 'http://demo.redmine.org/account/register'
  register_user
  @driver.find_element(:class, 'contextual').click
end

When(/^I change my old password to new$/) do
  change_password
end

Then(/^I see the message "([^"]*)"$/) do |message|
  actual_text=@driver.find_element(:id, 'flash_notice').text
  expect(actual_text).to eql message

end

Given(/^I am on Issue tab$/) do
  @driver.navigate.to 'http://demo.redmine.org/account/register'
  register_user
end

When(/^I create new isuue with Bug type$/) do
  create_new_project
  create_new_issue
end

Then(/^I see notice started with 'Bug'$/) do
  bug_created=@driver.find_element(:xpath, "//div[@id='content']/*[3]").text
  puts bug_created
  expect(bug_created.include?'Bug')
end