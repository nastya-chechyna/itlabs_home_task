module Modules

  def register_user
    @driver.navigate.to  'http://demo.redmine.org/'
    @driver.find_element(:class, 'register').click
    @wait.until {@driver.find_element(:id, 'user_login').displayed?}
    @login = ('login' + rand(9999).to_s)
    @driver.find_element(:id, 'user_login').send_keys @login
    @driver.find_element(:id, 'user_password').send_keys 'password'
    @driver.find_element(:id, 'user_password_confirmation').send_keys 'password'
    @driver.find_element(:id, 'user_firstname').send_keys 'loginname'
    @driver.find_element(:id, 'user_lastname').send_keys 'loginname'
    @driver.find_element(:id, 'user_mail').send_keys (@login + '@test.com')
    @driver.find_element(:name, 'commit').click

  end

  def log_in
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_keys @login
    @driver.find_element(:id, 'password').send_keys 'password'
    @driver.find_element(:name, 'login').click
  end

  def log_out
    @driver.find_element(:class, 'logout').click
    @wait.until {@driver.find_element(:class, 'login').displayed? }
  end

  def change_password
    @driver.find_element(:class, 'my-account').click
    @driver.find_element(:class, 'contextual').click
    @driver.find_element(:id, 'password').send_keys 'password'
    @driver.find_element(:id, 'new_password').send_keys 'new_password'
    @driver.find_element(:id, 'new_password_confirmation').send_keys 'new_password'
    @driver.find_element(:name, 'commit').click
  end

  def create_new_project
    project_name= ('Test Name Project' + rand(999999).to_s)

    @driver.find_element(:class, 'projects').click
    @driver.find_element(:css, "a[class*='icon-add']").click
    @driver.find_element(:id, 'project_name').send_keys  project_name
    @driver.find_element(:name, 'commit').click
  end

  def create_new_memeber
    @driver.find_element(:id, 'tab-members').click
    @driver.find_element(:class, 'icon-add').click
    sleep(3)
    @driver.find_element(:id, 'principal_search').send_keys 'ManagerTest'
    @wait.until {@driver.find_element(:css, "input[value='146955']").displayed?}
    @driver.find_element(:css, "input[value='146955']").click
    @driver.find_element(:class, 'roles-selection').find_element(:css, "[value='3']").click
    @driver.find_element(:id, 'member-add-submit').click
    sleep(3)
  end

  def member_edit_role
    @driver.find_element(:id, 'tab-members').click
    @driver.find_element(:css, "tr[class='even member']").find_element(:css, "a[class*='icon icon-edit']").click
    @driver.find_element(:css, "tr[class='even member']").find_element(:css, "input[value='3']").click
    @driver.find_element(:css, "tr[class='even member']").find_element(:css, "input[value='4']").click
    @driver.find_element(:css, "tr[class='even member']").find_element(:class, 'small').click
  end

  def create_new_product_version
    @driver.find_element(:id, 'tab-versions').click
    @driver.find_element(:id, 'tab-content-versions').find_element(:class, 'icon icon-add').click
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    @wait.until {@driver.find_element(:id, 'version_name').displayed?}
    @driver.find_element(:id, 'version_name').send_keys '1.1'
    @driver.find_element(:name, 'commit').click
  end

  def issue_bug
    @driver.find_element(:class, 'new-issue').click
    @driver.find_element(:id, 'issue_tracker_id').find_element(:css, "option[value='1']").click
    @driver.find_element(:id, 'issue_subject').send_keys 'New_issue. type1'
    @driver.find_element(:name, 'commit').click
  end

  def issue_feature
    @driver.find_element(:class, 'new-issue').click
    @driver.find_element(:id, 'issue_tracker_id').find_element(:css, "option[value='2']").click
    sleep(3)
    @driver.find_element(:id, 'issue_subject').send_keys 'New_issue. Feature type'
    @driver.find_element(:name, 'commit').click
  end

  def issue_support
    @driver.find_element(:class, 'new-issue').click
    sleep(1)
    @driver.find_element(:id, 'issue_tracker_id').find_element(:css, "option[value='3']").click
    sleep(3)
    @driver.find_element(:id, 'issue_subject').send_keys 'New_issue. Support type'
    @driver.find_element(:name, 'commit').click
  end

end