require('pg')
require_relative('../db/sql_runner')
require_relative('album')

class Artist

  attr_reader(:id, :name, :genre)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO artists (name, genre) VALUES ('#{@name}', '#{@genre}') RETURNING *;"
    artist = SqlRunner.run(sql).first
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

  def self.update(options)
    sql = "UPDATE artists SET 
            name = '#{options['name']}', 
            genre = '#{options['format']} 
          WHERE id=#{options['id']};"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM artists WHERE id = #{id};"
    SqlRunner.run(sql)
  end
end