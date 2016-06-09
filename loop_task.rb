require 'test/unit'
require 'selenium-webdriver'
require_relative 'modules'

class TestLoopTasks < Test::Unit::TestCase
  include Modules

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_random_action
    register_user
    create_new_project
    issue_bug
    i = 0

    action = [act1, act2]
    while i < action.size
      @driver.find_element(:class, 'issues').click
      if result ==  @driver.find_element(:class, 'nodata')
        issue_bug
      else
        @driver.find_element
      end

    end

  end
  def rand_string
    array = []
    j = 0
    while j < 1
      array.push(rand(1))
      j += 1
    end
    string = array.join(',')
  end

  def teardown
    @driver.quit
  end

end