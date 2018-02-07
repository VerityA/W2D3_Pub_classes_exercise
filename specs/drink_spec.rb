require("minitest/autorun")
require_relative("../drink")

class DrinkTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("G+T", 4.5, 1)
  end

  def test_drink_name
    assert_equal("G+T", @drink1.drink_name())
  end

  def test_price
    assert_equal(4.5, @drink1.price())
  end

  def test_alcohol_level
    assert_equal(1, @drink1.alcohol_level())
  end

end
