require_relative 'header_processor'
require_relative 'paragraph_processor'

class ChunkSorter
  attr_reader :string, :paragraph_processor, :header_processor

  def initialize(string)
    @string = string
    @paragraph_processor = ParagraphProcessor.new
    @header_processor = HeaderProcessor.new
  end

  def sort
    if string[0] == "#"
      return @header_processor
    else
      return @paragraph_processor
    end
  end

end