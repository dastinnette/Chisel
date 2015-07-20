require './lib/paragraph_processor'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ParagraphProcessorTest < Minitest::Test

  def test_adds_p_to_start_and_end_of_string
    string    = "Hello"
    paragraph = ParagraphProcessor.new
    assert_equal "<p>Hello</p>", paragraph.format(string)
  end
end
