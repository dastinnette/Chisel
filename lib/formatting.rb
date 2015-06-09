class Formatting

  def alter(string)
    string.insert(0, "<em>")
    string.insert(-1, "</em>")
    string.delete("*")
  end

  def alter2(string)
    string.insert(0, "<strong>")
    string.insert(-1, "</strong>")
    string.delete("*")
  end

end