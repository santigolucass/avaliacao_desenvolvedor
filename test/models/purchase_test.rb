require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  setup do
    @purchase = purchases(:first)
  end

  def file
    <<eof
Comprador	descrição	Preço Uniário	Quantidade	Endereço	Fornecedor
João Silva	R$10 off R$20 of food	10.0	2	987 Fake St	Bob's Pizza
Amy Pond	R$30 of awesome for R$10	10.0	5	456 Unreal Rd	Tom's Awesome Shop
Marty McFly	R$20 Sneakers for R$5	5.0	1	123 Fake St	Sneaker Store Emporium
Snake Plissken	R$20 Sneakers for R$5	5.0	4	123 Fake St	Sneaker Store Emporium
eof
  end

  def empty
    ''
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

  test 'process file' do
    purchases_count = Purchase.all.count
    Purchase.process(file)
    assert_equal(purchases_count + 4, Purchase.all.count)
  end

  test 'Test exception when processing empty file' do
    exception = assert_raises(RuntimeError) { Purchase.process(empty) }
  end
end