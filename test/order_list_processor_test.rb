require './lib/order_list_processor'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class OrderListProcessorTest < Minitest::Test

  def test_wraps_ol_in_tags
    string = " Sushi\n Barbeque\n Mexican"
    list_formatter = OrderListProcessor.new

    assert_equal "<ol>\n Sushi\n Barbeque\n Mexican\n</ol>", list_formatter.format_high(string)
  end

  def test_converts_line_items
    string = "1 Sushi"
    list_formatter = OrderListProcessor.new

    assert_equal "<ol>\n<li> Sushi</li>\n</ol>", list_formatter.format(string)
  end

  def test_unordered_list_output
    string = "1 Sushi\n2 Barbeque\n43 Mexican"
    list_formatter = OrderListProcessor.new

    assert_equal "<ol>\n<li> Sushi</li>\n<li> Barbeque</li>\n<li> Mexican</li>\n</ol>", list_formatter.format(string)
  end

end
