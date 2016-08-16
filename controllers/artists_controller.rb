require_relative('../models/artist')

get('/artists/new') do
  erb(:'/artists/new')
end

post('/artists') do
  @artists = Artist.new(params)
  @artists.save
  erb(:'/artists/create')
end

get('/artists') do
  @artists = Artist.all
  erb(:'/artists/index')
end

get('/artists/:id') do
  @artist = Artist.find(params[:id])
  erb(:'/artists/show')
end

get('/artists/:id/edit') do
  @artist = Artist.find(params[:id])
  erb(:'artists/edit')
end

post('/artists/:id') do
 Artist.update(params)
 redirect to("/artists/#{params[:id]}")
end

post('/artists/:id/delete') do
  @artist = Artist.destroy(params[:id])
  redirect to('/artists')
end