class UnorderListProcessor

  def ul_block_to_html(string)
    string.insert(0, "<ul>\n")
    string.insert(-1, "\n</ul>")
  end

  def ul_line_to_html(string)
    string.insert(0, '<li>')
    string.insert(-1, '</li>')
  end

  def format(string)
    lines = string.split("\n")
    lines.map do |line|
      line.delete!(line[0])
      ul_line_to_html(line)
    end
    html_lines = lines.join("\n")
    ul_block_to_html(html_lines)
  end
end
