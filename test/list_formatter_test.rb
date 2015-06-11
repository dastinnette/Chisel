require './lib/list_formatter'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ListFormatterTest < Minitest::Test

  def test_wraps_ul_in_tags
    string = " Sushi\n Barbeque\n Mexican"
    list_formatter = ListFormatter.new

    assert_equal "<ul>\n Sushi\n Barbeque\n Mexican\n</ul>", list_formatter.format_high(string)
  end

  def test_converts_line_items
    string = "* Sushi"
    list_formatter = ListFormatter.new

    assert_equal "<ul>\n<li> Sushi</li>\n</ul>", list_formatter.format(string)
  end

  def test_unordered_list_output
    string = "*Sushi\n*Barbeque\n*Mexican"
    list_formatter = ListFormatter.new

    assert_equal "<ul>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>\n</ul>", list_formatter.format(string)
  end

end
