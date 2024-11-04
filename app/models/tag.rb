class Tag < ApplicationRecord
  # Associations
  has_many :creature_resource_tags
  has_many :creature_resources, through: :creature_resource_tags

  # Validations
  validates :name, presence: true, uniqueness: true
end
