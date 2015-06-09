gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative './lib/renderer'
require 'pry'

class RendererTest < Minitest::Test

  def test_text_split_into_chunks
    string = "asdf\n\nasdf"
    renderer = Renderer.new(string)

    assert_equal ["asdf", "asdf"], renderer.chunk
  end

  def test_different_text_split_into_chunks
    string = "zxcv\n\nzxcv"
    renderer = Renderer.new(string)

    assert_equal ["zxcv", "zxcv"], renderer.chunk
  end

  def test_one_line_break_stays_one_chunk
    string = "asdf\nasdf"
    renderer = Renderer.new(string)

    assert_equal ["asdf\nasdf"], renderer.chunk
  end

  def test_longer_string
    string = "zxcv\n\nzxcv\n\nasdf"
    renderer = Renderer.new(string)

    assert_equal ["zxcv", "zxcv", "asdf"], renderer.chunk
  end

  def test_identify_a_header
    string = "zxcv\n\nzxcv\n\nasdf"
    renderer = Renderer.new(string)

    assert_equal ["zxcv", "zxcv", "asdf"], renderer.chunk
  end

end
