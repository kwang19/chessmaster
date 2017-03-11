class User < ApplicationRecord
  # Direct associations

  has_many   :games,
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  has_many   :gameratings,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  # Indirect associations

  has_many   :commented_games,
             :through => :comments,
             :source => :game

  has_many   :liked_games,
             :through => :likes,
             :source => :game

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
