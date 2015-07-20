class OrderListProcessor

  def ol_block_to_html(string)
    string.insert(0, "<ol>\n")
    string.insert(-1, "\n</ol>")
  end

  def ol_line_to_html(string)
    string.insert(0, '<li>')
    string.insert(-1, '</li>')
  end

  def format(string)
    lines = string.split("\n")
    lines.map do |line|
      delete_numbers(line)
      ol_line_to_html(line)
    end
    html_lines = lines.join("\n")
    ol_block_to_html(html_lines)
  end

  def leading_numbers
    ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
  end

  def delete_numbers(string)
    while leading_numbers.include?(string[0])
      string.delete!(string[0])
    end
    return string
  end

end
