json.extract! book, :id, :title, :genre, :plot, :year, :created_at, :updated_at
json.url book_url(book, format: :json)
