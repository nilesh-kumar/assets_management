require 'test_helper'

class AssetRequestsControllerTest < ActionController::TestCase
  setup do
    @asset_request = asset_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asset_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset_request" do
    assert_difference('AssetRequest.count') do
      post :create, asset_request: { date: @asset_request.date, description: @asset_request.description, name: @asset_request.name, vendor_id: @asset_request.vendor_id }
    end

    assert_redirected_to asset_request_path(assigns(:asset_request))
  end

  test "should show asset_request" do
    get :show, id: @asset_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asset_request
    assert_response :success
  end

  test "should update asset_request" do
    put :update, id: @asset_request, asset_request: { date: @asset_request.date, description: @asset_request.description, name: @asset_request.name, vendor_id: @asset_request.vendor_id }
    assert_redirected_to asset_request_path(assigns(:asset_request))
  end

  test "should destroy asset_request" do
    assert_difference('AssetRequest.count', -1) do
      delete :destroy, id: @asset_request
    end

    assert_redirected_to asset_requests_path
  end
end
