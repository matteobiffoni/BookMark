class Book < ApplicationRecord
  validates :title, length: { minimum: 2, maximum: 50 }
  validates :genre, length: { minimum: 3, maximum: 30 }
  validates :plot, length: { minimum: 10, maximum: 8000 }
  validates :amazon, presence: true
  validate :validate_year
  belongs_to :writer, :class_name => 'User'
  has_and_belongs_to_many :users
  resourcify
  def validate_year
    current_year = Date.today.year
    if year && (year.to_i < 1000 || year.to_i > current_year)
      errors.add(:year, "deve essere valido")
    end
  end
end
