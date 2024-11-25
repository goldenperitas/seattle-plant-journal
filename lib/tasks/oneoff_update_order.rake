task update_order: :environment do
  all_creature_resources = CreatureResource.all
  creature_resources_by_creature = all_creature_resources.group_by(&:creature_id)

  creature_resources_by_creature.each do |creature_id, creature_resources|
    creature_resources.each_with_index do |creature_resource, index|
      creature_resource.update!(order: index)
      puts "Creature ID #{creature_id}: Updated order for creature resource #{creature_resource.id} to #{index}"
    end
  end
end
