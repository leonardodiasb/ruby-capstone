class CreateBook
  def cover_state_fn
    print 'How is the Cover State? [(G)ood,(B)ad]: '
    cover_state = gets.chomp
    case cover_state
    when 'G' || 'g'
      'good'
    when 'B' || 'b'
      'bad'
    else
      puts "Option is not available, please enter 'G' for Good or 'B' for Bad "
      cover_state_fn
    end
  end

  def choose_label(labels)
    count = 0
    puts 'Select one label from the list:'
    labels.each do |e|
      puts "#{count + 1}) Title: #{e.title}, Color: #{e.color}"
      count += 1
    end
    puts ' '
    puts 'Or create a new Label by hitting the enter key'
    label = gets.chomp
    if label == ''
      create_new_label(labels)
    elsif label.to_i.zero?
      puts ' '
      puts 'Option is not available. Choose a number in the list: '
      choose_label(labels)
    elsif label.to_i <= count
      labels[label.to_i - 1]
    else
      puts 'Option is not available. Choose a number in the list: '
      choose_label(labels)
    end
  end

  def create_new_label(labels)
    puts 'What is the label title? '
    title = gets.chomp
    puts 'What is the label color? '
    color = gets.chomp
    new_label = Label.new(title: title, color: color)
    labels << new_label
    new_label
  end

  def create_book(books, labels)
    print 'Who is the Publisher? '
    publisher = gets.chomp
    cover_state = cover_state_fn
    print 'When was the publish date? '
    date = gets.chomp.to_i
    puts '---------------------'
    new_label = choose_label(labels)
    new_book = Book.new(date, publisher: publisher, cover_state: cover_state)
    new_label.add_item(new_book)
    books << new_book
    puts ' '
    puts 'Book created successfully'
  end
end
