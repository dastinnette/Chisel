class ChunkMaker
  attr_reader :doc

  def initialize(doc)
    @doc = doc
  end

  def chunk
    doc.split("\n\n")
  end
end
