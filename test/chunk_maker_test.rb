gem 'minitest'
require_relative '../lib/chunk_maker'
require 'pry'

class ChunkMakerTest < Minitest::Test

  def test_text_split_into_chunks
    string = "asdf\n\nasdf"
    renderer = ChunkMaker.new(string)
    assert_equal ["asdf", "asdf"], renderer.chunk
  end

  def test_different_text_split_into_chunks
    string = "zxcv\n\nzxcv"
    renderer = ChunkMaker.new(string)
    assert_equal ["zxcv", "zxcv"], renderer.chunk
  end

  def test_one_line_break_stays_one_chunk
    string = "asdf\nasdf"
    renderer = ChunkMaker.new(string)
    assert_equal ["asdf\nasdf"], renderer.chunk
  end

  def test_longer_string
    string = "zxcv\n\nzxcv\n\nasdf"
    renderer = ChunkMaker.new(string)
    assert_equal ["zxcv", "zxcv", "asdf"], renderer.chunk
  end

  def test_identify_a_header
    string = "zxcv\n\nzxcv\n\nasdf"
    renderer = ChunkMaker.new(string)
    assert_equal ["zxcv", "zxcv", "asdf"], renderer.chunk
  end

end
