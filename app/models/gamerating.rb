class Gamerating < ApplicationRecord
  validates :user_id, :presence => true
  validates :user_id, :presence => true, :uniqueness => { :scope => :game_id}
  validates :game_id, :presence => true
  validates :value, :numericality => { :greater_than => 0, :less_than_or_equal_to => 9}
  belongs_to :user
  belongs_to :game
end
