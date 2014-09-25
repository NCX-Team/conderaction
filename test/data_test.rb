require 'test_helper'

describe DCI::Data, '.as' do
  
  it 'responds to added methods inside the block' do
    data = test_person
    assert !data.respond_to?(:greet)

    data.as(TestPerson::Greeter) { assert data.respond_to?(:greet) }

    assert !data.respond_to?(:greet)
  end

  it 'responds to added methods without a block' do
    data = test_person
    assert !data.respond_to?(:greet)

    data.as(TestPerson::Greeter)

    assert data.respond_to?(:greet)
  end

  it 'returns results from added methods inside the block' do
    data = test_person
    assert_raises(NoMethodError) do
      data.greet
    end

    result = data.as(TestPerson::Greeter) { data.greet }
    assert_equal 'hello', result

    assert_raises(NoMethodError) do
      data.greet
    end    
  end

end