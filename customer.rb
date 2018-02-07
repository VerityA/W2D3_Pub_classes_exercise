class Customer

  attr_reader :customer_name, :wallet_value

  def initialize(customer_name, wallet_value)
    @customer_name = customer_name
    @wallet_value = wallet_value
  end

  def reduce_money_in_wallet(drink)
    @wallet_value -= drink.price()
  end

  def buy_drink(pub, drink)
    pub.sell_drink(drink)
    pub.increase_money_in_till(drink)
    reduce_money_in_wallet(drink)
  end

end
