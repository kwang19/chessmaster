class Game < ApplicationRecord
  validates :eventname, :presence => true
  validates :eventdate, :presence => true
  validates :white, :presence => true
  validates :black, :presence => true
  validates :result, :presence => true
  validates :pgn, :presence => true
  validates :user_id, :presence => true
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :gameratings
  has_many :fans, :through => :likes, :source => :user
  has_many :ratings, :through => :gameratings, :source =>:user
self.per_page = 10
end
