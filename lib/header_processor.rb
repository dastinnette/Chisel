class HeaderProcessor

  def format(string)
    count = string.count "#"
    string.insert(0, "<h#{count}>")
    string.insert(-1, "</h#{count}>")
    string.delete("#")
  end

  def type
    'header'
  end
end
