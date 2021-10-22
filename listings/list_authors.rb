class ListAuthors
  def list_authors(authors)
    count = 0
    if authors.empty?
      puts 'No authors were found...'
      return false
    end
    authors.each do |e|
      puts "#{count}) First Name: #{e.first_name}, Last Name: #{e.last_name}"
      count += 1
    end
  end
end
