require_relative 'renderer'
require_relative 'header_processor'
require_relative 'paragraph_processor'

class Chisel

  def initialize(markdown)
    @markdown = markdown
  end

  def to_html
    # @markdown
    #   "# My Life\n\nYou just *have* to try the cheesecake"

    chunks = # send @markdown to the chunk maker
      ["# My Life", "You just *have* to try the cheesecake"]

    chunk_formatters = # send the chunks to the chunk formatters
      [HeaderProcessor.new, ParagraphProcessor.new]

    html_chunks = chunk_formatters.zip(chunks).map { |cf, chunk| cf.format(chunk) }
      # ["<h1>My Life</h1>", "<p>You just *have* to try the cheesecake</p>"]

    html_chunks.join
  end
end


input_file  = ARGV[0]
output_file = ARGV[1]

markdown    = File.read(input_file)
html        = Chisel.new(markdown).to_html
File.write(output_file, html)