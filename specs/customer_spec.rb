require("minitest/autorun")
require_relative("../customer")
require_relative("../pub")
require_relative("../drink")

class CustomerTest < MiniTest::Test
  def setup
    @customer = Customer.new("Judy Dench", 50)

    @drink1 = Drink.new("G+T", 4.5)
    @drink2 = Drink.new("V+C", 3.5)
    @drink3 = Drink.new("Wine", 6)

    @drinks = [@drink1, @drink2, @drink3]
    @pub1 = Pub.new("The Alibi", @drinks)
  end

  def test_customer_name
    name = @customer.customer_name()
    assert_equal("Judy Dench", name)
  end

  def test_customer_wallet_value
    wallet_value = @customer.wallet_value()
    assert_equal(50, wallet_value)
  end

  def test_reduce_money_in_wallet
    new_wallet_value = @customer.reduce_money_in_wallet(@drink1)
    assert_equal(45.5,new_wallet_value)
  end

  def test_buy_drink
    @customer.buy_drink(@pub1, @drink2)
    wallet_value = @customer.wallet_value()
    money_in_till = @pub1.till()
    drinks = @pub1.drinks()
    assert_equal(46.5,wallet_value)
    assert_equal(103.5,money_in_till)
    assert_equal([@drink1, @drink3], drinks)
  end

end
