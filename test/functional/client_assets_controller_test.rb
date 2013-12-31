require 'test_helper'

class ClientAssetsControllerTest < ActionController::TestCase
  setup do
    @client_asset = client_assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_asset" do
    assert_difference('ClientAsset.count') do
      post :create, client_asset: { client_name: @client_asset.client_name, deleted: @client_asset.deleted, deleted_at: @client_asset.deleted_at, department: @client_asset.department, employee_id: @client_asset.employee_id, project_manager_id: @client_asset.project_manager_id, referenceable_id: @client_asset.referenceable_id, referenceable_type: @client_asset.referenceable_type }
    end

    assert_redirected_to client_asset_path(assigns(:client_asset))
  end

  test "should show client_asset" do
    get :show, id: @client_asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_asset
    assert_response :success
  end

  test "should update client_asset" do
    put :update, id: @client_asset, client_asset: { client_name: @client_asset.client_name, deleted: @client_asset.deleted, deleted_at: @client_asset.deleted_at, department: @client_asset.department, employee_id: @client_asset.employee_id, project_manager_id: @client_asset.project_manager_id, referenceable_id: @client_asset.referenceable_id, referenceable_type: @client_asset.referenceable_type }
    assert_redirected_to client_asset_path(assigns(:client_asset))
  end

  test "should destroy client_asset" do
    assert_difference('ClientAsset.count', -1) do
      delete :destroy, id: @client_asset
    end

    assert_redirected_to client_assets_path
  end
end
