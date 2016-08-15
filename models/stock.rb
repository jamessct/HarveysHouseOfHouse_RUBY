require('pg')
require_relative('../db/sql_runner')
require_relative('album')

class Stock

  attr_reader(:id, :album_id, :format, :stock_level, :threshold, :buy_price, :sell_price)

  def initialize(options)
    @id = options['id'].to_i
    @album_id = options['album_id'].to_i
    @format = options['format']
    @stock_level = options['stock_level'].to_i
    @threshold = options['threshold'].to_i
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
  end

  def save()
    sql = "INSERT INTO stock (album_id, format, stock_level, threshold, buy_price, sell_price) VALUES (#{@album_id},  '#{@format}', #{@stock_level}, #{@threshold}, #{@buy_price}, #{@sell_price}) RETURNING *;"
    stock = SqlRunner.run(sql).first
    @id = stock['id']
  end

  def self.all()
    sql = "SELECT * FROM stock;"
    stock = SqlRunner.run(sql)
    result = stock.map { |stock| Stock.new(stock)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM stock WHERE id = #{id};"
    stock = SqlRunner.run(sql).first
    return Stock.new(stock)
  end
end