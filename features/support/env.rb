require 'selenium-webdriver'
require 'rspec/expectations'

World(RSpec::Matchers) #to make rspec matchers work

require_relative 'HelperMethods'
World(HelperMethods)
