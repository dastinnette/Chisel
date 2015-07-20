require './lib/line_formatter'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class LineFormatterTest < Minitest::Test

  def test_adds_em_to_word_with_1star
    string = " *Hello* "
    format = LineFormatter.new
    assert_equal " <em>Hello</em> ", format.star_to_html(string)
  end

  def test_adds_em_to_word_in_string_with_1star
    string = "That is *really* interesting"
    format = LineFormatter.new
    assert_equal "That is <em>really</em> interesting", format.star_to_html(string)
  end

  def test_adds_strong_to_string_with_2star
    string = " **Hello** "
    format = LineFormatter.new
    assert_equal " <strong>Hello</strong> ", format.double_star_to_html(string)
  end

  def test_formats_sentence_properly_with_nested_stars
    string = "*Hello have a **wonderful** day*"
    format = LineFormatter.new
    assert_equal "<em>Hello have a <strong>wonderful</strong> day</em>", format.formatting_to_html(string)
  end

  def test_formats_sentence_properly_with_multiple_em_and_strong
    string = "*Hello* and **have** a **wonderful** *day*"
    format = LineFormatter.new
    assert_equal "<em>Hello</em> and <strong>have</strong> a <strong>wonderful</strong> <em>day</em>", format.formatting_to_html(string)
  end
end
