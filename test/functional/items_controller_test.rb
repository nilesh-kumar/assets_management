require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { branch: @item.branch, computer_id: @item.computer_id, deleted: @item.deleted, deleted_at: @item.deleted_at, description: @item.description, device_id: @item.device_id, faulty: @item.faulty, faulty_date: @item.faulty_date, invoice_id: @item.invoice_id, is_accessory: @item.is_accessory, model_number: @item.model_number, name: @item.name, peripheral: @item.peripheral, provider: @item.provider, repaired_date: @item.repaired_date, returned: @item.returned, returned_date: @item.returned_date, scrap: @item.scrap, serial_number: @item.serial_number, stock: @item.stock, transferred_from: @item.transferred_from, transferred_to: @item.transferred_to, vendor_id: @item.vendor_id, warranty: @item.warranty }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    put :update, id: @item, item: { branch: @item.branch, computer_id: @item.computer_id, deleted: @item.deleted, deleted_at: @item.deleted_at, description: @item.description, device_id: @item.device_id, faulty: @item.faulty, faulty_date: @item.faulty_date, invoice_id: @item.invoice_id, is_accessory: @item.is_accessory, model_number: @item.model_number, name: @item.name, peripheral: @item.peripheral, provider: @item.provider, repaired_date: @item.repaired_date, returned: @item.returned, returned_date: @item.returned_date, scrap: @item.scrap, serial_number: @item.serial_number, stock: @item.stock, transferred_from: @item.transferred_from, transferred_to: @item.transferred_to, vendor_id: @item.vendor_id, warranty: @item.warranty }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
