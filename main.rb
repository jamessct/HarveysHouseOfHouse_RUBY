require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('controllers/artists_controller.rb')
require_relative('controllers/albums_controller.rb')
require_relative('controllers/stock_controller.rb')

get('/home') do
  erb(:home)
end

get('/options') do
  erb(:options)
end

