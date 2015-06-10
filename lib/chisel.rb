require_relative 'chunk_sorter'
require_relative 'chunk_maker'

class Chisel
  def initialize(markdown)
    @markdown = markdown
  end

  def to_html
    chunks = ChunkMaker.new(@markdown).chunk
    chunk_formatters = chunks.map { |chunk| ChunkSorter.new(chunk).sort }
    html_chunks = chunk_formatters.zip(chunks).map { |cf, chunk| cf.format(chunk) }
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
