class Creature < ApplicationRecord
  # Associations
  has_many :creature_resources, dependent: :destroy

  # Validations
  validates :english_name, presence: true
  validates :scientific_name, presence: true
end
