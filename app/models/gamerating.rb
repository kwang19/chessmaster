class Gamerating < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :game

  # Indirect associations

  # Validations

end
