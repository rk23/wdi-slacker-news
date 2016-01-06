class User < ActiveRecord::Base
  validates :email, :name,
            presence: true,
            uniqueness: {
                case_sensitive: false
            }
  validates_presence_of :password, on: :create

  has_secure_password
  has_many :posts
  has_many :comments, as: :commentable

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
end

