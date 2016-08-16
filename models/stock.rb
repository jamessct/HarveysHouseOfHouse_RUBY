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

  def albums()
    sql = "SELECT * FROM albums WHERE id = #{@id}"
    albums = SqlRunner.run(sql)
    result = albums.map {|album| Album.new(album)}
    return result
  end

  def artists()
    sql = "SELECT * FROM artists WHERE id = #{@album_id}"
    artists = SqlRunner.run(sql)
    result = artists.map {|artist| Artist.new(artist)}
    return result
  end

  def stock_check()
    if @stock_level >= @threshold
      return "A-OK"
    elsif @stock_level <= @threshold
      return "Running low"
    elsif @stock_level == 0
      return "Out of Stock"
    end
  end

  def stock_colour_code()
    if @stock_level == "A-OK"
      return "green"
    elsif @stock_level == "Running low"
      return "Amber"
    elsif @stock_level == "Out of Stock"
      return "Red"
    end
  end

  def self.all()
    sql = "SELECT * FROM stock;"
    stock = SqlRunner.run(sql)
    result = stock.map {|stock| Stock.new(stock)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM stock WHERE id = #{id};"
    stock = SqlRunner.run(sql).first
    return Stock.new(stock)
  end

  def self.update(options)
    sql = "UPDATE stock SET
            format = '#{options['format']}',
            stock_level = #{options['stock_level']},
            threshold = #{options['threshold']},
            buy_price = #{options['buy_price']},
            sell_price = #{options['sell_price']}
            WHERE id = #{options['id']};"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM stock WHERE id = #{id};"
    SqlRunner.run(sql)
  end
end