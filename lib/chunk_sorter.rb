require_relative './lib/header_processor'
require_relative './lib/paragraph_processor'

class ChunkSorter
  attr_reader :string, :paragraph_processor, :header_processor

  def initialize(string)
    @string = string
    @paragraph_processor = ParagraphProcessor.new
    @header_processor = HeaderProcessor.new
  end

  def sort
    if string[0] == "#"
      @header_processor.format(string)
      return "header"
    else
      @paragraph_processor.format(string)
      return "paragraph"
    end
  end

end