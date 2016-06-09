module HelperMethods

  def register_user
    @login = ('test_user' + rand(9999).to_s)

  hash = {user_login:@login,
          user_password:'password',
          user_password_confirmation: 'password',
          user_firstname: @login,
          user_lastname: @login,
          user_mail: @login + '@test.com' }
  hash.each_pair do |key, value|
    @driver.find_element(:id, key).send_keys value
  end
  @driver.find_element(:name, 'commit').click
  end

  def change_password
  hash = {password: 'password',
        new_password: 'new_password',
        new_password_confirmation:'new_password'}
    hash.each_pair do |key, value|
      @driver.find_element(:id, key).send_keys value
    end
  @driver.find_element(:name, 'commit').click
  end

  def create_new_project
    project_name= ('Test Name Project' + rand(999999).to_s)
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:css, "a[class*='icon-add']").click
    @driver.find_element(:id, 'project_name').send_keys  project_name
    @driver.find_element(:name, 'commit').click
  end

  def create_new_issue
    @driver.find_element(:class, 'new-issue').click
    @driver.find_element(:id, 'issue_tracker_id').find_element(:css, "option[value='1']").click
    @driver.find_element(:id, 'issue_subject').send_keys 'New_issue. type1'
    @driver.find_element(:name, 'commit').click
  end

end

