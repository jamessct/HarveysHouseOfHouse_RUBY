require('minitest/autorun')
require('minitest/rg')
require_relative('../models/album')

def setup
  @album = Album.new({"name" => "James Bond Theme Tunes"})
end

def test_name
  assert_equal("James Bond Theme Tunes", @album.name)
end