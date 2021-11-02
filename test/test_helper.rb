# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'minitest/unit'
require 'mocha/minitest'
require 'minitest/mock'
require 'minitest/ci'
require 'faker'

module ActiveSupport
  class TestCase
    include FactoryBot::Syntax::Methods
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)
    
    # Setup all factories & fixtures
    FactoryBot.find_definitions
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all


    def assert_total_emp_count(companies, count)
        companies.each do |company|
            assert_equal count, company.reload.total_employees_count
        end
    end
  end
end
