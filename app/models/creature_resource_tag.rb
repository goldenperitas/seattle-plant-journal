class CreatureResourceTag < ApplicationRecord
  belongs_to :creature_resource
  belongs_to :tag
end
