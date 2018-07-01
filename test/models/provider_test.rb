require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  def setup
    @provider = providers(:first_provider)
  end
  test 'valid provider' do
    assert @provider.valid?
  end

  test 'invalid without name' do
    @provider.name = nil
    refute @provider.valid?, 'saved user without a name'
  end

  test 'invalid without address' do
    @provider.address = nil
    refute @provider.valid?, 'saved user without a name'
  end

  test 'association with purchases' do
    assert_equal 1, @provider.purchases.size
  end
end
