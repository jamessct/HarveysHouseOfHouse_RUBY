require('pg')
require_relative('../db/sql_runner')
require_relative('../models/stock')

class Album

  attr_reader(:id, :name, :artist_id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @artist_id = options['artist_id']
  end

  def save()
    sql = "INSERT INTO albums (name, artist_id) VALUES ('#{@name}',  #{@artist_id}) RETURNING *;"
    album = SqlRunner.run(sql).first
    @id = album['id']
  end


end