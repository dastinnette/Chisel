require './lib/header_processor'
require './lib/paragraph_processor'
require './lib/unorder_list_processor'
require './lib/order_list_processor'

class ChunkFormatter
  attr_reader :string, :paragraph_processor, :header_processor

  def initialize(chunk)
    @string                 = chunk
    @paragraph_processor    = ParagraphProcessor.new
    @unorder_list_processor = UnorderListProcessor.new
    @header_processor       = HeaderProcessor.new
    @order_list_processor   = OrderListProcessor.new
  end

  def format
    processor.format(@string)
  end

  def processor
    if string[0] == "#"
      return @header_processor
    elsif string[0] == "*"
      return @unorder_list_processor
    elsif leading_numbers.include?(string[0])
      return @order_list_processor
    else
      return @paragraph_processor
    end
  end

  def leading_numbers
    ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end
end
