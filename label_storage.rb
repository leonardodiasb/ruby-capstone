require 'json'

class LabelStorage
  def load_labels(books)
    File.open('labels.json', 'a')
    if File.read('labels.json') != ''
      labels = JSON.parse(File.read('labels.json'))
      labelscollection = []
      labels.each do |label|
        lbl = Label.new(title: label['title'], color: label['color'])
        label['items_ids'].each do |i|
          books.each do |b|
            lbl.add_item(b) if i == b.id
          end
        end
        labelscollection << lbl
      end
      return labelscollection
    end
    []
  end

  def store_labels(labels)
    labelsjs = []
    labels.each do |e|
      label_items = []
      e.items.each do |i|
        label_items << i.id
      end
      labelsjs << { 'title' => e.title, 'color' => e.color, 'items_ids' => label_items }
    end
    File.write('labels.json', JSON.generate(labelsjs))
  end
end
