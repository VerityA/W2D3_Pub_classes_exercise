require("minitest/autorun")
require_relative("../customer")
require_relative("../pub")
require_relative("../drink")

class CustomerTest < MiniTest::Test
  def setup
    @customer1 = Customer.new("Judy Dench", 50, 65, 5)
    @customer2 = Customer.new("Morty", 10, 13, 0)
    @customer3 = Customer.new("Helen Mirren", 60, 65, 11)

    @drink1 = Drink.new("G+T", 4.5, 1)
    @drink2 = Drink.new("V+C", 3.5, 1.5)
    @drink3 = Drink.new("Wine", 6, 2)

    @drinks = [@drink1, @drink2, @drink3]
    @pub1 = Pub.new("The Alibi", @drinks)
  end

  def test_customer_name
    name = @customer1.customer_name()
    assert_equal("Judy Dench", name)
  end

  def test_customer_wallet_value
    wallet_value = @customer1.wallet_value()
    assert_equal(50, wallet_value)
  end

  def test_age
    age = @customer1.age()
    assert_equal(65, age)
  end

  def test_pished_level
    assert_equal(5, @customer1.pished_level())
  end

  def test_reduce_money_in_wallet
    new_wallet_value = @customer1.reduce_money_in_wallet(@drink1)
    assert_equal(45.5,new_wallet_value)
  end

  def test_check_age__over_18
    old_enough = @customer1.old_enough()
    assert_equal(true, old_enough)
  end

  def test_check_age__under_18
    old_enough = @customer2.old_enough()
    assert_equal(false, old_enough)
  end

  def test_increase_pished_level
    pished_level = @customer2.increase_pished_level(@drink1)
    assert_equal(1,pished_level)
  end

  def test_buy_drink__over_18__below_limit
    @customer1.buy_drink(@pub1, @drink2)
    wallet_value = @customer1.wallet_value()
    money_in_till = @pub1.till()
    drinks = @pub1.drinks()
    pished_level = @customer1.pished_level()
    assert_equal(46.5,wallet_value)
    assert_equal(103.5,money_in_till)
    assert_equal([@drink1, @drink3], drinks)
    assert_equal(6.5, pished_level)
  end

  def test_buy_drink__over_18__above_limit
    @customer3.buy_drink(@pub1, @drink2)
    wallet_value = @customer3.wallet_value()
    money_in_till = @pub1.till()
    drinks = @pub1.drinks()
    pished_level = @customer3.pished_level()
    assert_equal(60,wallet_value)
    assert_equal(100,money_in_till)
    assert_equal([@drink1, @drink2, @drink3], drinks)
    assert_equal(11, pished_level)
  end

  def test_buy_drink__under_18
    @customer2.buy_drink(@pub1, @drink2)
    wallet_value = @customer2.wallet_value()
    money_in_till = @pub1.till()
    drinks = @pub1.drinks()
    pished_level = @customer2.pished_level()
    assert_equal(10,wallet_value)
    assert_equal(100,money_in_till)
    assert_equal([@drink1, @drink2, @drink3], drinks)
    assert_equal(0, pished_level)
  end

end
