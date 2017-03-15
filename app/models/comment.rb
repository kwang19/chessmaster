class Comment < ApplicationRecord
belongs_to :game
belongs_to :user
validates :user_id, :presence => true
validates :game_id, :presence => true
validates :body, :presence => true
end
