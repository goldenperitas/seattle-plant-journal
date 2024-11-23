class Creature < ApplicationRecord
  # Associations
  has_many :creature_resources, dependent: :destroy

  # Validations
  validates :english_name, presence: true
  validates :scientific_name, presence: true

  # Active Storage
  has_one_attached :featured_image do |attachable|
    attachable.variant :square, resize_to_fill: [ 800, 800 ]
    attachable.variant :thumb, resize_to_fill: [ 150, 150 ]
  end
  has_many_attached :additional_images do |attachable|
    attachable.variant :square, resize_to_fill: [ 200, 200 ]
  end
end
