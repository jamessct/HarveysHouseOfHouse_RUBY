require_relative('../models/album')

get('/albums/new') do
  @artists = Artist.all
  erb(:'albums/new')
end

post('/albums') do
  @albums = Album.new(params)
  @albums.save
  erb(:'albums/create')
end

get('/albums') do
  @albums = Album.all
  erb(:'albums/index')
end

get('/albums/:id') do
  @albums = Album.find(params[:id])
  erb(:'albums/show')
end