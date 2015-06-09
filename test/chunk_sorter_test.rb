gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative './lib/chunk_sorter'
require 'pry'

class ChunkSorterTest < Minitest::Test

  def test_returns_header_if_string_element_zero_is_h
    string = "#Hello"
    chunk_sorter = ChunkSorter.new(string)

    assert_equal "header", chunk_sorter.sort
  end

  def test_returns_paragraph_if_string_element_zero_is_not_h
    string = "Hello"
    chunk_sorter = ChunkSorter.new(string)

    assert_equal "paragraph", chunk_sorter.sort
  end

end
