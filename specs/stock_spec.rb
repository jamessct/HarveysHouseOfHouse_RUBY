require('minitest/autorun')
require('minitest/rg')
require_relative('../models/stock')

class TestStock < Minitest::Test

  def setup()
    @stock = Stock.new({
      "format" => "CD", 
      "stock_level" => "4", 
      "threshold" => "5", 
      "buy_price" => "6", 
      "sell_price" => "9"
    })
  end

  def test_format()
    assert_equal("CD", @stock.format)
  end

  def test_stock_level()
    assert_equal(4, @stock.stock_level)
  end

  def test_threshold()
    assert_equal(5, @stock.threshold)
  end

  def test_buy_price()
    assert_equal(6, @stock.buy_price)
  end

  def test_sell_price()
    assert_equal(9, @stock.sell_price)
  end

  def test_colour_code()
    assert_equal("color: yellow", @stock.stock_colour_code)
  end

  def test_stock_check()
    assert_equal("4 [Running low]", @stock.stock_check)
  end
end