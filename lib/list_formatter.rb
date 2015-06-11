#"<p>* Sushi" => "<li>Sushi</li>"

class ListFormatter

  def format_high(string)
    string.delete!("<p>")
    string.delete!("*")
    string.insert(0, '<ul>')
    string.insert(-1, '</ul>')
  end

  def format_low(string)
    string.delete!("<p>")
    string.delete!("*")
    string.insert(0, '<li>')
    string.insert(-1, '</li>')
  end

end
