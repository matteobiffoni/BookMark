class Book < ApplicationRecord
  belongs_to :writer, :class_name => 'User'
  has_and_belongs_to_many :users
  resourcify
end
