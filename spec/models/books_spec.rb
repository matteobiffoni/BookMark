require "rails_helper"

describe Book, :type => :model do

  it  "Create Book" do
    book = Book.new(:title => "ExampleTitle", :genre => "ExampleGenre", :amazon => "ExampleLink", :plot => "ExamplePlot", :year => "1850")
    book.writer = User.new(:name => "Example", :email => "example@email.it", :password => "password", :user_role => "writer")
    expect(book).to be_valid
  end

  it "is not valid without a writer" do
    book = Book.new(:title => "ExampleTitle", :genre => "ExampleGenre", :amazon => "ExampleLink", :plot => "ExamplePlot", :year => "1850")
    expect(book).to_not be_valid
  end

  it "is not valid without a title" do
      book = Book.new(:title => nil, :genre => "ExampleGenre", :amazon => "ExampleLink", :plot => "ExamplePlot", :year => "1850")
      book.writer = User.new(:name => "Example", :email => "example@email.it", :password => "password", :user_role => "writer")
      expect(book).to_not be_valid
  end

  it "is not valid without a genre" do
      book = Book.new(:title => "ExampleTitle", :genre => nil, :amazon => "ExampleLink", :plot => "ExamplePlot", :year => "1850")
      book.writer = User.new(:name => "Example", :email => "example@email.it", :password => "password", :user_role => "writer")
      expect(book).to_not be_valid
  end

  it "is not valid without an amazon link" do
      book = Book.new(:title => "ExampleTitle", :genre => "ExampleGenre", :amazon => nil, :plot => "ExamplePlot", :year => "1850")
      book.writer = User.new(:name => "Example", :email => "example@email.it", :password => "password", :user_role => "writer")
      expect(book).to_not be_valid
  end

  it "is not valid without a plot" do
    book = Book.new(:title => "ExampleTitle", :genre => "ExampleGenre", :amazon => "ExampleLink", :plot => nil, :year => "1850")
    book.writer = User.new(:name => "Example", :email => "example@email.it", :password => "password", :user_role => "writer")
    expect(book).to_not be_valid
  end

  it "is not valid with an invalid year" do
    book = Book.new(:title => "ExampleTitle", :genre => "ExampleGenre", :amazon => "ExampleLink", :plot => "ExamplePlot", :year => "sdfdf")
    book.writer = User.new(:name => "Example", :email => "example@email.it", :password => "password", :user_role => "writer")
    expect(book.save).to be_falsey
  end

  it "is not valid with a too short title" do
    book = Book.new(:title => "E", :genre => "ExampleGenre", :amazon => "ExampleLink", :plot => "ExamplePlot", :year => "1850")
    book.writer = User.new(:name => "Example", :email => "example@email.it", :password => "password", :user_role => "writer")
    expect(book).to_not be_valid
  end

  it "is not valid with a too long title" do
    book = Book.new(:title => "E"*51, :genre => "ExampleGenre", :amazon => "ExampleLink", :plot => "ExamplePlot", :year => "1850")
    book.writer = User.new(:name => "Example", :email => "example@email.it", :password => "password", :user_role => "writer")
    expect(book).to_not be_valid
  end

  it "is not valid with a too short genre" do
    book = Book.new(:title => "ExampleTitle", :genre => "Ex", :amazon => "ExampleLink", :plot => "ExamplePlot", :year => "1850")
    book.writer = User.new(:name => "Example", :email => "example@email.it", :password => "password", :user_role => "writer")
    expect(book).to_not be_valid
  end

  it "is not valid with a too long genre" do
    book = Book.new(:title => "ExampleTitle", :genre => "E"*31, :amazon => "ExampleLink", :plot => "ExamplePlot", :year => "1850")
    book.writer = User.new(:name => "Example", :email => "example@email.it", :password => "password", :user_role => "writer")
    expect(book).to_not be_valid
  end

  it "is not valid with a too short plot" do
    book = Book.new(:title => "ExampleTitle", :genre => "ExampleGenre", :amazon => "ExampleLink", :plot => "Example", :year => "1850")
    book.writer = User.new(:name => "Example", :email => "example@email.it", :password => "password", :user_role => "writer")
    expect(book).to_not be_valid
  end

  it "is not valid with a too long genre" do
    book = Book.new(:title => "ExampleTitle", :genre => "ExampleGenre", :amazon => "ExampleLink", :plot => "E"*8001, :year => "1850")
    book.writer = User.new(:name => "Example", :email => "example@email.it", :password => "password", :user_role => "writer")
    expect(book).to_not be_valid
  end
end
