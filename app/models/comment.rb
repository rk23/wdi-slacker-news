class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :replies, class_name: "Comment",
                      foreign_key: "this_id",
                      as: :commentable
  belongs_to :this, class_name: "Comment"
end
