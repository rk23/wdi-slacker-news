class Post < ActiveRecord::Base
  validates :title, :link,
            presence: true,
            uniqueness: {
                case_sensitive: false
            }

  belongs_to :user
  has_many  :comments, as: :commentable
end
