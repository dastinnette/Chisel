require './lib/header_processor'
require './lib/paragraph_processor'
require './lib/list_formatter'

class ChunkFormatter
  attr_reader :string, :paragraph_processor, :header_processor

  def initialize(chunk)
    @string              = chunk
    @paragraph_processor = ParagraphProcessor.new
    @list_processor      = ListFormatter.new
    @header_processor    = HeaderProcessor.new
  end

  def format
    processor.format(@string)
  end

  def processor
    if string[0] == "#"
      return @header_processor
    elsif string[0] == "*"
      return @list_processor
    else
      return @paragraph_processor

    end
  end

end
