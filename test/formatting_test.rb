require './lib/formatting'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class FormattingTest < Minitest::Test

  def test_adds_em_to_word_with_1star
    string = " *Hello* "
    format = Formatting.new

    assert_equal " <em>Hello</em> ", format.alter_em(string)
  end

  def test_adds_em_to_word_in_string_with_1star
    string = "That is *really* interesting"
    format = Formatting.new

    assert_equal "That is <em>really</em> interesting", format.alter_em(string)
  end

  def test_adds_strong_to_string_with_2star
    string = " **Hello** "
    format = Formatting.new

    assert_equal " <strong>Hello</strong> ", format.alter_strong(string)
  end

  def test_formats_sentence_properly_with_nested_stars
    string = "*Hello have a **wonderful** day*"
    format = Formatting.new

    assert_equal "<em>Hello have a <strong>wonderful</strong> day</em>", format.alter_all(string)
  end

  def test_formats_sentence_properly_with_multiple_em_and_strong
    string = "*Hello* and **have** a **wonderful** *day*"
    format = Formatting.new

    assert_equal "<em>Hello</em> and <strong>have</strong> a <strong>wonderful</strong> <em>day</em>", format.alter_all(string)
  end
end

