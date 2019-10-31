class Gossip < ActiveRecord::Base

  belongs_to :user
  
  validates :title, presence: true, length: { minimum: 3, maximum: 14 }
  validates :content, presence: true, length: { minimum: 10, maximum: 140 }
  validates :user_id, presence: true


end
