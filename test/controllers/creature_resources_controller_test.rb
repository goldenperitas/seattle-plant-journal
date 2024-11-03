require "test_helper"

class CreatureResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creature_resource = creature_resources(:one)
  end

  test "should get index" do
    get creature_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_creature_resource_url
    assert_response :success
  end

  test "should create creature_resource" do
    assert_difference("CreatureResource.count") do
      post creature_resources_url, params: { creature_resource: {} }
    end

    assert_redirected_to creature_resource_url(CreatureResource.last)
  end

  test "should show creature_resource" do
    get creature_resource_url(@creature_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_creature_resource_url(@creature_resource)
    assert_response :success
  end

  test "should update creature_resource" do
    patch creature_resource_url(@creature_resource), params: { creature_resource: {} }
    assert_redirected_to creature_resource_url(@creature_resource)
  end

  test "should destroy creature_resource" do
    assert_difference("CreatureResource.count", -1) do
      delete creature_resource_url(@creature_resource)
    end

    assert_redirected_to creature_resources_url
  end
end
