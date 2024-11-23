class CreatureResource < ApplicationRecord
  # Associations
  belongs_to :creature
  has_many :creature_resource_tags, dependent: :destroy
  has_many :tags, through: :creature_resource_tags

  # Validations

  # ENUMs
  enum resource_type: {
    website: 0,
    video: 1,
    audio: 2,
    book: 3,
    paper: 4,
    event: 5,
    location: 6,
    art: 7,
    other: 99
  }, _prefix: true
end
