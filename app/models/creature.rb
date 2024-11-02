class Creature < ApplicationRecord
  # Associations

  # Validations
  validates :english_name, presence: true
end
