require "rails_helper"

describe User, :type => :model do

  it  "Create Reader" do
    user = User.new(:name => "Example", :email => "example@email.it", :password => "password", :user_role => "reader")
    expect(user).to be_valid
  end

  it "Create Writer" do
    user = User.new(:name => "Example", :email => "example@email.it", :password => "password", :user_role => "writer")
    expect(user).to be_valid
  end

  it "Create Publisher" do
    user = User.new(:name => "Example", :email => "example@email.it", :password => "password", :user_role => "publisher")
    expect(user).to be_valid
  end

  it "is not valid without a name" do
      user = User.new(:name => nil)
      expect(user).to_not be_valid
  end

  it "is not valid without an email" do
      user = User.new(:name => "Example", :email => nil)
      expect(user).to_not be_valid
  end

  it "is not valid without a role" do
      user = User.new(:name => "Example", :email => "example@email.it", :user_role => nil)
      expect(user).to_not be_valid
  end
end
