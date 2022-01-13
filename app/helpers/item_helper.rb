module ItemHelper
  def format_price(price)
    Money.new(price, "USD").format(symbol: true)
  end

  def format_weight(item)
    number_to_human(item.weight, units: {unit: "g", thousand: "kg"})
  end
  
  def sortable_column(column, header = nil)
    header ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to header, request.query_parameters.merge({sort: column, direction: direction})
  end
end
