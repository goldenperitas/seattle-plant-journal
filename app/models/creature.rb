class Creature < ApplicationRecord
  # Associations
  has_many :creature_resources, dependent: :destroy

  # Callbacks
  before_validation :generate_slug, if: :english_name_changed?

  # Validations
  validates :english_name, presence: true
  validates :scientific_name, presence: true
  validates :slug, presence: true, uniqueness: true

  # Active Storage
  has_one_attached :featured_image do |attachable|
    attachable.variant :square, resize_to_fill: [ 800, 800 ]
    attachable.variant :thumb, resize_to_fill: [ 150, 150 ]
  end
  has_many_attached :additional_images do |attachable|
    attachable.variant :square, resize_to_fill: [ 200, 200 ]
  end

  # ENUMs
  enum toxic_status: {
    non_toxic: 0,
    use_caution: 1,
    toxic: 2
  }, _prefix: true

  # Instance Methods
  def to_param
    slug
  end

  private

  def generate_slug
    return if english_name.blank?

    base_slug = english_name.downcase
                           .gsub(/[^a-z0-9\s-]/, "")
                           .gsub(/\s+/, "-")
                           .gsub(/-+/, "-")
                           .strip
                           .gsub(/^-|-$/, "")

    candidate_slug = base_slug
    counter = 1

    while Creature.exists?(slug: candidate_slug)
      candidate_slug = "#{base_slug}-#{counter}"
      counter += 1
    end

    self.slug = candidate_slug
  end
end
