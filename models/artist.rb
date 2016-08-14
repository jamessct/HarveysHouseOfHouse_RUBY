require('pg')
require_relative('../db/sql_runner')
require_relative('../models/album')

class Artist

  attr_reader(:id, :name, :genre)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}', '#{@genre}') RETURNING *;"
    artists = SqlRunner.run(sql).first
    @id = artist['id']
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    albums = SqlRunner.run(sql)
    result = albums.map { |album| Album.new(album)}
    return result
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    result = artists.map { |artist| Artist.new(artist)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id =  #{id};"
    artist = SqlRunner.run(sql).first
    return Artist.new(artist)
  end
end