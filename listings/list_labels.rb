class ListLabels
  def list_labels(labels)
    count = 0
    if labels.empty?
      puts 'No labels were found...'
      return false
    end
    labels.each do |e|
      puts "#{count}) Title: #{e.title}, Color: #{e.color}"
      count += 1
    end
  end
end
