require './lib/order_list_processor'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class OrderListProcessorTest < Minitest::Test

  def test_wraps_ol_block
    string       = " Sushi\n Barbeque\n Mexican"
    ol_processor = OrderListProcessor.new
    assert_equal "<ol>\n Sushi\n Barbeque\n Mexican\n</ol>", ol_processor.ol_block_to_html(string)
  end

  def test_wraps_ol_lines
    string       = "1 Sushi"
    ol_processor = OrderListProcessor.new
    assert_equal "<ol>\n<li> Sushi</li>\n</ol>", ol_processor.format(string)
  end

  def test_ordered_list_output_to_html
    string       = "1 Sushi\n2 Barbeque\n43 Mexican"
    ol_processor = OrderListProcessor.new
    assert_equal "<ol>\n<li> Sushi</li>\n<li> Barbeque</li>\n<li> Mexican</li>\n</ol>", ol_processor.format(string)
  end
end
