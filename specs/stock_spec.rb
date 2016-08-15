require('minitest/autorun')
require('minitest/rg')
require_relative('../models/stock')

class TestStock < Minitest::Test

  def setup
    @Stock.new
  end
end