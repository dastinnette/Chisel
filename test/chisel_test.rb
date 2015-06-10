gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/chisel'

class ChiselTest < Minitest::Test
  def test_chisel_converts_markdown_to_html
    markdown = "#i am a header\n\ni am a paragraph"
    html     = "<h1>i am a header</h1>\n\n<p>i am a paragraph</p>"
    assert_equal html, Chisel.new(markdown).to_html
  end
end
