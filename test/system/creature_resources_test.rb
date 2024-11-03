require "application_system_test_case"

class CreatureResourcesTest < ApplicationSystemTestCase
  setup do
    @creature_resource = creature_resources(:one)
  end

  test "visiting the index" do
    visit creature_resources_url
    assert_selector "h1", text: "Creature resources"
  end

  test "should create creature resource" do
    visit creature_resources_url
    click_on "New creature resource"

    click_on "Create Creature resource"

    assert_text "Creature resource was successfully created"
    click_on "Back"
  end

  test "should update Creature resource" do
    visit creature_resource_url(@creature_resource)
    click_on "Edit this creature resource", match: :first

    click_on "Update Creature resource"

    assert_text "Creature resource was successfully updated"
    click_on "Back"
  end

  test "should destroy Creature resource" do
    visit creature_resource_url(@creature_resource)
    click_on "Destroy this creature resource", match: :first

    assert_text "Creature resource was successfully destroyed"
  end
end
