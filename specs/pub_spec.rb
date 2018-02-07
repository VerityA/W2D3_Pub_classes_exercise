require("minitest/autorun")
require_relative("../pub")
require_relative("../drink")

class PubTest < MiniTest::Test

  def setup

    @drink1 = Drink.new("G+T", 4.5)
    @drink2 = Drink.new("V+C", 3.5)
    @drink3 = Drink.new("Wine", 6)

    @drinks = [@drink1, @drink2, @drink3]
    @pub1 = Pub.new("The Alibi", @drinks)
  end

  def test_pub_name
    assert_equal("The Alibi", @pub1.pub_name())
  end

  def test_till_value
    assert_equal(100,@pub1.till())
  end

  def test_drinks_count
    count = @pub1.drinks_count
    assert_equal(3, count)
  end

  def test_sell_drink__in_stock
    @pub1.sell_drink(@drink1)
    new_stock = @pub1.drinks()
    assert_equal([@drink2, @drink3], new_stock)
  end

  def test_sell_drink__not_in_stock
      @pub1.sell_drink(@drink4)
      new_stock = @pub1.drinks()
      assert_equal([@drink1, @drink2, @drink3], new_stock)
  end

  def test_increase_money_in_till
    money_in_till = @pub1.increase_money_in_till(@drink1)
    assert_equal(104.5, money_in_till)
  end

end
