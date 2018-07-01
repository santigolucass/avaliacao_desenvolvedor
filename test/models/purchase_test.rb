require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  setup do
    @purchase = purchases(:first)
  end

  test 'valid purchase' do
    assert @purchase.valid?
  end

  test 'invalid without provider' do
    @purchase.provider_id = nil
    refute @purchase.valid?
  end

  test 'invalid without costumer' do
    @purchase.costumer_id = nil
    refute @purchase.valid?
  end

end