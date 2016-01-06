class Post < ActiveRecord::Base
  validates :title, :link,
            presence: true,
            uniqueness: {
                case_sensitive: false
            }

  belongs_to :user
  has_many  :comments, as: :commentable
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
