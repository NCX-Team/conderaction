require 'minitest/autorun'
require 'conderaction'
require 'rspec/mocks'
require 'minitest/rspec_mocks'

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