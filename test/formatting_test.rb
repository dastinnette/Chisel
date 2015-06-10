require_relative '../lib/formatting'

class FormattingTest < Minitest::Test

  def test_adds_em_to_string_with_1star
    string = "*Hello*"
    format = Formatting.new

    assert_equal "<em>Hello</em>", format.alter(string)
  end

  def test_adds_strong_to_string_with_2star
    string = "**Hello**"
    format = Formatting.new

    assert_equal "<strong>Hello</strong>", format.alter2(string)
  end

  def test_formats_sentence_properly_with_nested_stars
    string = "*Hello have a **wonderful** day*"
    format = Formatting.new

    skip
    assert_equal "<em>Hello have a <strong>wonderful</strong> day</em>", format.alter2(string)
  end
end

