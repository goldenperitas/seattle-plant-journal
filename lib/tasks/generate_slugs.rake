namespace :creatures do
  desc "Generate slugs for existing creatures"
  task generate_slugs: :environment do
    puts "Generating slugs for creatures without slugs..."

    creatures_without_slugs = Creature.where(slug: [ nil, "" ])
    total_count = creatures_without_slugs.count

    if total_count.zero?
      puts "All creatures already have slugs!"
      next
    end

    puts "Found #{total_count} creatures without slugs"

    creatures_without_slugs.find_each.with_index do |creature, index|
      begin
        creature.send(:generate_slug)
        creature.save!
        puts "#{index + 1}/#{total_count}: Generated slug '#{creature.slug}' for '#{creature.english_name}'"
      rescue => e
        puts "#{index + 1}/#{total_count}: Failed to generate slug for '#{creature.english_name}': #{e.message}"
      end
    end

    puts "Finished generating slugs!"
  end
end
