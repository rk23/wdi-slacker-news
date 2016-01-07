class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :replies, class_name: "Comment",
                      foreign_key: "this_id",
                      as: :commentable
  belongs_to :this, class_name: "Comment"
  has_many :votes, as: :voteable

  def total_votes
    self.up_votes - self.down_votes
  end
  
  def up_votes
    self.votes.where(vote: true).size
  end
  
  def down_votes
    self.votes.where(vote: false).size  
  end
end
