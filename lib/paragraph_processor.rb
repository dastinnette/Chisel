class ParagraphProcessor
  def format(string)
    string.insert(0, '<p>')
    string.insert(-1, '</p>')
  end

  def type
    'paragraph'
  end

end
