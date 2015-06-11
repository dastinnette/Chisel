
class OrderListProcessor

  def format_high(string)
    string.insert(0, "<ol>\n")
    string.insert(-1, "\n</ol>")
  end

  def format_low(string)
    string.insert(0, '<li>')
    string.insert(-1, '</li>')
  end

  def format(string)
    lines = string.split("\n")
    lines.map do |line|
      delete_numbers(line)
      format_low(line)
    end
    formatted_lines = lines.join("\n")
    format_high(formatted_lines)
  end

  def array_method
    ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."]
  end

  def delete_numbers(string)
    while array_method.include?(string[0])
      string.delete!(string[0])
    end
    return string
  end

end
