ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"


require 'minitest/spec'

require 'capybara/rails'
require 'mocha/minitest'

Dir[Rails.root.join('test/support/**/*.rb')].each { |f| require f }

Minitest::Reporters.use!(Minitest::Reporters::ProgressReporter.new(color: true),ENV,Minitest.backtrace_filter)


class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #fixtures :all

  # Add more helper methods to be used by all tests here...
  extend Minitest::Spec::DSL
  
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include AuthenticationMacros
  
  before(:each) { reset_login }
  
end
