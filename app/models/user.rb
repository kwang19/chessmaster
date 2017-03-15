class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    has_many :games
    has_many :comments
    has_many :likes
    has_many :gameratings
    has_many :liked_games, :through => :likes, :source => :game
    # has_many :games_ratings, :through => :gameratings, :source => :game
    validates :username, :presence => true, :uniqueness => true

    mount_uploader :photo, PhotoUploader
end
