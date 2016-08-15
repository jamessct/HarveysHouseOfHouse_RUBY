require_relative('../models/stock')

get('/stock/new') do
  @albums = Album.all
  erb(:'stock/new')
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