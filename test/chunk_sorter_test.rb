gem 'minitest'
require_relative '../lib/chunk_sorter'
require 'pry'

class ChunkSorterTest < Minitest::Test
  def test_returns_header_if_string_element_zero_is_h
    string = "#Hello"
    type   = ChunkSorter.new(string).sort.type
    assert_equal "header", type
  end

  def test_returns_paragraph_if_string_element_zero_is_not_h
    string = "Hello"
    type   = ChunkSorter.new(string).sort.type
    assert_equal "paragraph", type
  end
end
