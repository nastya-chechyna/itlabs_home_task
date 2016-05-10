require 'test/unit'
require 'selenium-webdriver'
require_relative 'modules'

class TestTests < Test::Unit::TestCase
  include Modules

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_positive
    register_user

    expected_text = 'Your account has been activated. You can now log in.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_log_out
    register_user
    log_out
    button_login=@driver.find_element(:class, 'login')
    assert(button_login.displayed?)

  end

  def test_positive_log_in
    log_in
    button_logout = @driver.find_element(:class, 'my-account')
    assert(button_logout.displayed?)

  end

  def test_change_password
    register_user
    change_password
    expected_text= 'Password was successfully updated.'
    actual_text=@driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text,actual_text)
  end

  def test_positive_create_project
    register_user
    create_new_project
    expected_text = 'Successful creation.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_create_new_member
    register_user
    create_new_project
    new_member=@driver.find_element(:css, "a[href='/users/146955']")
    assert(new_member.displayed?)
  end

  def test_edit_roles
    register_user
    create_new_project
    member_edit_role
    expected_text=@driver.find_element(:css, "tr[class='even member']").find_element(:class, 'hol').find_element(:css, "[value='4']")
    assert(expected_text.displayed?)
  end

  def test_create_new_version
    register_user
    create_new_project
    create_new_product_version
    expected_text = 'Successful creation.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_issue_bug
    register_user
    create_new_project
    issue_bug
    bug_created=@driver.find_element(:xpath, "//div[@id='content']/*[3]").text
    puts bug_created
    assert(bug_created.include?'Bug')

  end

  def test_issue_feature
    register_user
    create_new_project
    issue_feature
    feature_created=@driver.find_element(:xpath, "//div[@id='content']/*[3]").text
    puts feature_created
    assert(feature_created.include?'Feature')
  end

  def test_issue_support
    register_user
    create_new_project
    issue_support
    support_created=@driver.find_element(:xpath, "//div[@id='content']/*[3]").text
    assert(support_created.include?'Support')
  end

  def teardown
    @driver.quit
  end

end
