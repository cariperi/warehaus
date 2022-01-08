module ItemHelper
  def format_price(item)
    Money.new(item.price, "USD").format(symbol: true)
  end

  def format_weight(item)
    number_to_human(item.weight, units: {unit: "g", thousand: "kg"})
  end 
end
