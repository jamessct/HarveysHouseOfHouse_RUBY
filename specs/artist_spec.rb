require('minitest/autorun')
require('minitest/rg')
require_relative('../models/artist')

class TestArtist < Minitest::Test

  def setup
    @artist = Artist.new({"name" => "Various Artists", "genre" => "Soundtrack"})
  end

  def test_name
    assert_equal("Various Artists", @artist.name)
  end

  def test_genre
    assert_equal("Soundtrack", @artist.genre)
  end
end