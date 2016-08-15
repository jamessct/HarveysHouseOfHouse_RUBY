require_relative('../models/stock')
require_relative('../models/artist')

get('/stock/new') do
  @artist = Artist.all
  erb(:'stock/select_artist')
  redirect to('/stock/#{params[:id]/new')
end

get('/stock/:id/new') do

  @albums = Album.all
  erb(:'stock/new_stock')
end

post('/stock') do
  @stock = Stock.new(params)
  @stock.save
  erb(:'stock/create')
end

get('/stock') do
  @stock = Stock.all
  @albums = Album.all
  erb(:'stock/index')
end

get('/stock/:id') do
  @stock = Stock.find(params[:id])
  erb(:'stock/show')
end

get('/stock/:id/edit') do
  @stock = Stock.find(params[:id])
  erb(:'stock/edit')
end

put('/stock/:id') do
  @stock = Stock.update(params)
  redirect to('/stock/#{params[:id]}')
end

post('/stock/:id/delete') do
  @stock = Stock.delete(params[:id])
  redirect to('/stock')
end