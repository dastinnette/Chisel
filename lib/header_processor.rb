class HeaderProcessor

  def format(string)
    count = string.count "#"
    string.insert(0, "<h#{count}>")
    string.insert(-1, "</h#{count}>")
    string.delete("#")
  end

end

# need to add h2, etc depending on the number of preceding hashes
# need to delete all hashes once format complete