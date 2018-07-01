require 'test_helper'

class CostumerTest < ActiveSupport::TestCase
  def setup
    @costumer = costumers(:first_costumer)
  end
  test 'valid costumer' do
    assert @costumer.valid?
  end

  test 'invalid without name' do
    @costumer.name = nil
    refute @costumer.valid?
  end

  test 'association with purchases' do
    assert_equal 1, @costumer.purchases.size
  end
end
