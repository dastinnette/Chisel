require './lib/chunk_formatter'
require './lib/chunk_maker'
require './lib/formatter'

class Chisel
  def initialize(markdown)
    @markdown = markdown
  end

  def to_html
    chunks      = ChunkMaker.new(@markdown).chunk
    html_chunks = chunks.map do |chunk|
      formatted = ChunkFormatter.new(chunk).format
      Formatter.new.formatting_to_html(formatted)
    end
    html_chunks.join("\n\n")
  end
end


if __FILE__ == $PROGRAM_NAME
  input_file  = ARGV[0]
  output_file = ARGV[1]

  markdown    = File.read(input_file)
  html        = Chisel.new(markdown).to_html
  File.write(output_file, html)
end
