class Pub

  attr_reader :pub_name, :drinks, :till

  def initialize(pub_name, drinks)
    @till = 100
    @pub_name = pub_name
    @drinks = drinks
  end

  def drinks_count
    return @drinks.count()
  end

  def sell_drink(drink)
    for d in @drinks
      if d == drink
        @drinks.delete(d)
      end
    end
  end

  def increase_money_in_till(drink)
    @till += drink.price()
  end

end
