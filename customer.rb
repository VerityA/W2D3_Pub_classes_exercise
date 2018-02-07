class Customer

  attr_reader :customer_name, :wallet_value, :age, :pished_level

  def initialize(customer_name, wallet_value, age, pished_level)
    @customer_name = customer_name
    @wallet_value = wallet_value
    @age = age
    @pished_level = pished_level
    @alcohol_limit = 10
  end

  def reduce_money_in_wallet(drink)
    @wallet_value -= drink.price()
  end

  def buy_drink(pub, drink)
    return if (old_enough() == false || @pished_level >= @alcohol_limit)
      pub.sell_drink(drink)
      pub.increase_money_in_till(drink)
      reduce_money_in_wallet(drink)
      increase_pished_level(drink)
  end

  def old_enough()
    @age >= 18
  end

  def increase_pished_level(drink)
    @pished_level += drink.alcohol_level()
  end

end
