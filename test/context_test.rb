require 'test_helper'

describe DCI::Context, '.characterize' do
  
  it 'responds to added methods inside the block' do
    data = test_person
    context = test_greet
    assert !data.respond_to?(:greet)

    context.characterize data.as(TestPerson::Greeter) do
      assert data.respond_to?(:greet)
    end

    assert !data.respond_to?(:greet)
  end

end