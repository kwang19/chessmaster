class Like < ApplicationRecord
  validates :user_id, :presence => true
  validates :user_id, :presence => true, :uniqueness => { :scope => :game_id}
  validates :game_id, :presence => true

  belongs_to :user
  belongs_to :game
end
