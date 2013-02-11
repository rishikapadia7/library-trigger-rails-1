def get_path_of page_name
  case page_name
    when 'Edit book'
      return edit_book_path(@book.id)
    when 'Show book'
      return show_book_path(@book.id)
    else
      puts page_name
      raise "The path is not found."
  end
end

def formatted page_name
  page_name.gsub(' ','_').downcase
end

def path_of page_name
  unless page_name.include?(' ')
    puts self.send("#{formatted page_name}_path".to_sym)
    return self.send("#{formatted page_name}_path".to_sym)
  else
    puts get_path_of page_name
    return get_path_of page_name
  end
end
