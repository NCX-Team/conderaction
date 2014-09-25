require 'minitest/autorun'
require 'conderaction'

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