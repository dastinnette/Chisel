require './lib/list_formatter'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ListFormatterTest < Minitest::Test

  def test_converts_list_group
    string = "* Sushi\n* Barbeque\n* Mexican"
    list_formatter = ListFormatter.new

    assert_equal "<ul> Sushi\n Barbeque\n Mexican</ul>", list_formatter.format_high(string)
  end

  def test_converts_line_item_one
    string = "<p>* Sushi"
    list_formatter = ListFormatter.new

    assert_equal "<li> Sushi</li>", list_formatter.format_low(string)
  end

  def test_unordered_list_output
    skip
    string = "* Sushi\n* Barbeque\n* Mexican"
    list_formatter = ListFormatter.new

    assert_equal "<ul>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>\n</ul>", list_formatter.format(string)
  end

end
