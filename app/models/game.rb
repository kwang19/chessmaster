class Game < ApplicationRecord
  # Direct associations

  belongs_to :user

  has_many   :likes,
             :dependent => :destroy

  has_many   :gameratings,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  # Indirect associations

  has_many   :fans,
             :through => :likes,
             :source => :user

  # Validations

end
