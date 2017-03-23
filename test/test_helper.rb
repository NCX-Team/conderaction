require 'minitest/autorun'
require 'conderaction'
require 'rspec/mocks'
require 'minitest/rspec_mocks'

class Minitest::Test
  include Minitest::RSpecMocks

  class << self
    # Helper to define a test method using a String. Under the hood, it replaces
    # spaces with underscores and defines the test method.
    #
    #   test "verify something" do
    #     ...
    #   end
    def test(name, &block)
      test_name = "test_#{name.gsub(/\s+/,'_')}".to_sym
      defined = method_defined? test_name
      raise "#{test_name} is already defined in #{self}" if defined
      if block_given?
        define_method(test_name, &block)
      else
        define_method(test_name) do
          flunk "No implementation provided for #{name}"
        end
      end
    end
  end
end

class TestPerson
  include DCI::Data

  def name
    'name from TestPerson'
  end

  module Greeter
    def greet
      'hello'
    end
  end
end

class TestGreet
  include DCI::Context
end

def test_person
  TestPerson.new
end

def test_greet
  TestGreet.new
end

class TestAction
  include DCI::Context

  def perform(*args)
    yield(args) if block_given?
  end
end