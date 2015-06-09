# Chisel.rb = read input, let renderer do its thing, write output
# input markdown file
# take input_file.md and send string to renderer.rb
# renderer.rb sends to chunk_maker.rb
# chunk_maker.rb cuts message into chunks of text where blank lines occur between headings or paragraphs, etc
# classify those chunks according to a leading # or absence of one (header vs paragraph)
# based on the type of chunk, send chunk to its respective renderer

class Renderer
  attr_reader :doc

  def initialize(doc)
    @doc = doc
  end

  def chunk
    doc.split("\n\n")
  end

end


# take chunks (strings in an array) of text that appear within the chunk array
# and evaluate each independently
# sort by first character of the string
