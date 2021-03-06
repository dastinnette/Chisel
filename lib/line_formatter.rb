class LineFormatter

  def double_star_to_html(string)
    while string.include? "**"
    string.sub!("**", "<strong>")
    string.sub!("**", "</strong>")
    end
  end

  def star_to_html(string)
    string.sub!("*", "<em>")
    string.sub!("*", "</em>")
  end

  def formatting_to_html(string)
    while string.include? "*"
    double_star_to_html(string)
    star_to_html(string)
    end
    string
  end
end
