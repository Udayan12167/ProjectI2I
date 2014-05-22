require 'test_helper'

class PoolGroupsControllerTest < ActionController::TestCase
  setup do
    @pool_group = pool_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pool_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pool_group" do
    assert_difference('PoolGroup.count') do
      post :create, pool_group: { poolers: @pool_group.poolers }
    end

    assert_redirected_to pool_group_path(assigns(:pool_group))
  end

  test "should show pool_group" do
    get :show, id: @pool_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pool_group
    assert_response :success
  end

  test "should update pool_group" do
    patch :update, id: @pool_group, pool_group: { poolers: @pool_group.poolers }
    assert_redirected_to pool_group_path(assigns(:pool_group))
  end

  test "should destroy pool_group" do
    assert_difference('PoolGroup.count', -1) do
      delete :destroy, id: @pool_group
    end

    assert_redirected_to pool_groups_path
  end
end
