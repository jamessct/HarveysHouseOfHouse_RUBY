require('pg')
require_relative('../db/sql_runner')
require_relative('stock')

class Album

  attr_reader(:id, :name, :artist_id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (name, artist_id) VALUES ('#{@name}',  #{@artist_id}) RETURNING *;"
    album = SqlRunner.run(sql).first
    @id = album['id']
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
    artist = SqlRunner.run(sql).first
    result = Artist.new(artist)
    return result
  end

  def stock()
    sql = "SELECT * FROM stock WHERE album_id = #{@id};"
    stock = SqlRunner.run(sql)
    result = Stock.new(stock).first
    return result
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    result = albums.map { |album| Album.new(album)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id};"
    album = SqlRunner.run(sql).first
    return Album.new(album)
  end

  def self.update(options)
    sql = "UPDATE albums SET
            name = '#{options['name']}',
            artist_id = #{options['artist_id']}"
    SqlRunner.run(sql)
  end
end