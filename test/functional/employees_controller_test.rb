require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { branch: @employee.branch, deleted: @employee.deleted, deleted_at: @employee.deleted_at, department: @employee.department, designation: @employee.designation, email_id: @employee.email_id, email_password: @employee.email_password, employee_number: @employee.employee_number, helpdesk_id: @employee.helpdesk_id, helpdesk_password: @employee.helpdesk_password, join_date: @employee.join_date, name: @employee.name, pandian_id: @employee.pandian_id, pandian_password: @employee.pandian_password, pm_tool_id: @employee.pm_tool_id, pm_tool_password: @employee.pm_tool_password, resign_date: @employee.resign_date, sapience_id: @employee.sapience_id, sapience_password: @employee.sapience_password, skype_id: @employee.skype_id, skype_password: @employee.skype_password, technology: @employee.technology, transfered_from: @employee.transfered_from, transfered_to: @employee.transfered_to, wiki_id: @employee.wiki_id, wiki_password: @employee.wiki_password }
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    put :update, id: @employee, employee: { branch: @employee.branch, deleted: @employee.deleted, deleted_at: @employee.deleted_at, department: @employee.department, designation: @employee.designation, email_id: @employee.email_id, email_password: @employee.email_password, employee_number: @employee.employee_number, helpdesk_id: @employee.helpdesk_id, helpdesk_password: @employee.helpdesk_password, join_date: @employee.join_date, name: @employee.name, pandian_id: @employee.pandian_id, pandian_password: @employee.pandian_password, pm_tool_id: @employee.pm_tool_id, pm_tool_password: @employee.pm_tool_password, resign_date: @employee.resign_date, sapience_id: @employee.sapience_id, sapience_password: @employee.sapience_password, skype_id: @employee.skype_id, skype_password: @employee.skype_password, technology: @employee.technology, transfered_from: @employee.transfered_from, transfered_to: @employee.transfered_to, wiki_id: @employee.wiki_id, wiki_password: @employee.wiki_password }
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end
