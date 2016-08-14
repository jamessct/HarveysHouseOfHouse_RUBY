require('minitest/autorun')
require('minitest/rg')
require_relative('../models/artist')

def setup
  @artist = Artist.new({"name" => "Various Artists", "genre" => "Soundtrack"})
end

def test_name
  assert_equal("Various Artists", @artist.name)
end