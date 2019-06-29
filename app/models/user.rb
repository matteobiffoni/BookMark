class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  validates_presence_of :user_role
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?

  has_many :written_books, :class_name => 'Book', :foreign_key => 'writer_id'
  has_and_belongs_to_many :books
  has_many :writers, class_name: "User", foreign_key: "publisher_id"
  belongs_to :publisher, class_name: "User", optional: true
  after_create :add_user_role

  def link_account_from_omniauth(auth)
    self.provider = auth.provider
    self.uid = auth.uid
    self.save
  end

  private
    def add_user_role
      role = self.user_role
      return if role == "Lettore/Lettrice"
      if role == "Scrittore/Scrittrice"
        role = "writer"
      elsif role == "Casa Editrice"
        role = "publisher"
      else return
      end
      self.add_role(role)
      self.save
    end
end
