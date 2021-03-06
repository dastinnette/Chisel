require 'minitest/autorun'
require 'minitest/pride'
require './lib/chunk_formatter'


class ChunkFormatterTest < Minitest::Test
  def test_returns_header_if_string_element_zero_is_hash
    string = "#Hello"
    type   = ChunkFormatter.new(string).processor.type
    assert_equal "header", type
  end

  def test_returns_paragraph_if_string_element_zero_is_not_hash
    string = "Hello"
    type   = ChunkFormatter.new(string).processor.type
    assert_equal "paragraph", type
  end
end
