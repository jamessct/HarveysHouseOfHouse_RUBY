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
  @artists = Artist.find(params[:id])
  erb(:'/artists/show')
end