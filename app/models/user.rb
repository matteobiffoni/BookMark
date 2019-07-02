class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

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


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.save
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
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
