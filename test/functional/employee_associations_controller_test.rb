require 'test_helper'

class EmployeeAssociationsControllerTest < ActionController::TestCase
  setup do
    @employee_association = employee_associations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_association" do
    assert_difference('EmployeeAssociation.count') do
      post :create, employee_association: {  }
    end

    assert_redirected_to employee_association_path(assigns(:employee_association))
  end

  test "should show employee_association" do
    get :show, id: @employee_association
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_association
    assert_response :success
  end

  test "should update employee_association" do
    put :update, id: @employee_association, employee_association: {  }
    assert_redirected_to employee_association_path(assigns(:employee_association))
  end

  test "should destroy employee_association" do
    assert_difference('EmployeeAssociation.count', -1) do
      delete :destroy, id: @employee_association
    end

    assert_redirected_to employee_associations_path
  end
end
