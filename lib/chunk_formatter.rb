require_relative 'header_processor'
require_relative 'paragraph_processor'

class ChunkFormatter
  attr_reader :string, :paragraph_processor, :header_processor

  def initialize(chunk)
    @string              = chunk
    @paragraph_processor = ParagraphProcessor.new
    @header_processor    = HeaderProcessor.new
  end

  def format
    processor.format(@string)
  end

  def processor
    if string[0] == "#"
      return @header_processor
    else
      return @paragraph_processor
    end
  end

end
