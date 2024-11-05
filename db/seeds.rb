# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Master data
tag_names = [
  [ "Science", "#2883b5" ],
  [ "Culture", "#3bad8c" ],
  [ "History", "#d1912e" ],
  [ "Medicine", "#af6cd9" ]
]

tag_names.each do |tag_name|
  Tag.find_or_create_by!(name: tag_name[0], color: tag_name[1])
end
