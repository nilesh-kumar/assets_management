require 'test_helper'

class DevicesControllerTest < ActionController::TestCase
  setup do
    @device = devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device" do
    assert_difference('Device.count') do
      post :create, device: { deleted: @device.deleted, deleted_at: @device.deleted_at, faulty: @device.faulty, faulty_date: @device.faulty_date, invoice_id: @device.invoice_id, name: @device.name, os: @device.os, os_version: @device.os_version, provider: @device.provider, repaired_date: @device.repaired_date, returned: @device.returned, returned_date: @device.returned_date, scrap: @device.scrap, stock: @device.stock, vendor_id: @device.vendor_id, warranty: @device.warranty }
    end

    assert_redirected_to device_path(assigns(:device))
  end

  test "should show device" do
    get :show, id: @device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device
    assert_response :success
  end

  test "should update device" do
    put :update, id: @device, device: { deleted: @device.deleted, deleted_at: @device.deleted_at, faulty: @device.faulty, faulty_date: @device.faulty_date, invoice_id: @device.invoice_id, name: @device.name, os: @device.os, os_version: @device.os_version, provider: @device.provider, repaired_date: @device.repaired_date, returned: @device.returned, returned_date: @device.returned_date, scrap: @device.scrap, stock: @device.stock, vendor_id: @device.vendor_id, warranty: @device.warranty }
    assert_redirected_to device_path(assigns(:device))
  end

  test "should destroy device" do
    assert_difference('Device.count', -1) do
      delete :destroy, id: @device
    end

    assert_redirected_to devices_path
  end
end
