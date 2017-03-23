require 'test_helper'
require 'rspec/mocks'

class ContextTest < Minitest::Test
  test "responds to added methods inside the block" do
    data = test_person
    context = test_greet
    assert !data.respond_to?(:greet)

    context.characterize data.as(TestPerson::Greeter) do
      assert data.respond_to?(:greet)
    end

    assert !data.respond_to?(:greet)
  end

  test "will execute a perform directly" do
    expect(TestAction).to receive(:perform)
    TestAction.perform
  end

  test "will execute a yield on a perform" do
    value = false
    TestAction.perform do
      value = true
    end

    assert value
  end

  test "will pass all the parameters through" do
    params = nil
    TestAction.perform(1, 2, 3) do |args|
      params = args
    end

    assert_equal [1, 2, 3], params
  end
end