class Game < ApplicationRecord
  # Direct associations

  has_many   :gameratings,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
