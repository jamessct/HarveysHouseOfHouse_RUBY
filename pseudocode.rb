class Stocks
  def check_health_of_stock
    if stock_level is > or = minimum stock_level
      return stock_level + "OK"
    elsif stock_level is < minimum stock_level
      return stock_level + "Running Low"
    elsif stock_level = empty
      return 0 + "Out of Stock"
    end
  end
end