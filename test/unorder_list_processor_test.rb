require './lib/unorder_list_processor'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class UnorderListProcessorTest < Minitest::Test

  def test_wraps_ul_block
    string            = " Sushi\n Barbeque\n Mexican"
    ul_list_processor = UnorderListProcessor.new
    assert_equal "<ul>\n Sushi\n Barbeque\n Mexican\n</ul>", ul_list_processor.ul_block_to_html(string)
  end

  def test_wraps_ul_lines
    string            = "* Sushi"
    ul_list_processor = UnorderListProcessor.new
    assert_equal "<ul>\n<li> Sushi</li>\n</ul>", ul_list_processor.format(string)
  end

  def test_unordered_list_output_to_html
    string            = "*Sushi\n*Barbeque\n*Mexican"
    ul_list_processor = UnorderListProcessor.new
    assert_equal "<ul>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>\n</ul>", ul_list_processor.format(string)
  end
end
