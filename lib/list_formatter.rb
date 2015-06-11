#"<p>* Sushi" => "<li>Sushi</li>"

class ListFormatter

  def format_high(string)
    string.insert(0, "<ul>\n")
    string.insert(-1, "\n</ul>")
  end

  def format_low(string)
    string.insert(0, '<li>')
    string.insert(-1, '</li>')
  end

  def format(string)
    lines = string.split("\n")
    lines.map do |line|
      line.delete!(line[0])
      format_low(line)
    end
    formatted_lines = lines.join("\n")
    format_high(formatted_lines)
  end

end
