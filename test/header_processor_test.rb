gem 'minitest'
require_relative '../lib/header_processor'

class ChunkSorterTest < Minitest::Test

  def test_adds_h1_to_string_with_1hash
    string = "#Hello"
    header = HeaderProcessor.new

    assert_equal "<h1>Hello</h1>", header.format(string)
  end

  def test_adds_h2_to_string_with_2hash
    string = "##Hello"
    header = HeaderProcessor.new

    assert_equal "<h2>Hello</h2>", header.format(string)
  end

  def test_adds_h3_to_string_with_3hash
    string = "###Hello"
    header = HeaderProcessor.new

    assert_equal "<h3>Hello</h3>", header.format(string)
  end

  def test_adds_h4_to_string_with_4hash
    string = "####Hello"
    header = HeaderProcessor.new

    assert_equal "<h4>Hello</h4>", header.format(string)
  end

  def test_adds_h5_to_string_with_5hash
    string = "#####Hello"
    header = HeaderProcessor.new

    assert_equal "<h5>Hello</h5>", header.format(string)
  end

end
