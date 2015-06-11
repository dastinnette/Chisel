class Formatting

  def alter_strong(string)
    string.sub!("**", "<strong>")
    string.sub!("**", "</strong>")
  end

  def alter_em(string)
    string.sub!("*", "<em>")
    string.sub!("*", "</em>")
  end

  def alter_all(string)
    while string.include? "*"
    alter_strong(string)
    alter_em(string)
    end
    string
  end

end

