class EmployeesController < ApplicationController
  before_filter :authenticate_user!
  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.active_employees.search(params[:search],params[:action]).order(sort_column('Employee', 'name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
   
    ## Search with solr gem ##
    # @employees = Employee.search do
    #   fulltext params[:search] 
    #   paginate :page => params[:page], :per_page => 5
    #   order_by sort_column, sort_direction
    #   without(:deleted, true)
    # end.results
    ## End ##
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  # List of resources assigned to the active employees
  def assets
    @employee_assets = Employee.employee_assets
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employee_assets }
    end
  end

  # List of devices assigned to the active employees
  def devices
    @employee_devices = Employee.employee_devices
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employee_devices }
    end
  end

  # List of recently joined employees
  def new_joinees
    @employees = Employee.active_employees_and_new_joinees.search(params[:search],params[:action]).order(sort_column('Employee', 'name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
    
    ## Search with solr gem ##
    # @employees = Employee.search do
    #   fulltext params[:search] 
    #   paginate :page => params[:page], :per_page => 5
    #   order_by sort_column, sort_direction
    #   without(:deleted, true)
    #   with(:join_date, Employee.last_month_range)
    # end.results
    ## End ##
       
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  # List of recently joined employees
  def deleted
    @employees = Employee.inactive_employees.search(params[:search],params[:action]).order(sort_column('Employee', 'name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
   
    ## Search with solr gem ##
    # @employees = Employee.search do
    #   fulltext params[:search] 
    #   paginate :page => params[:page], :per_page => 5
    #   order_by sort_column, sort_direction
    #   with(:deleted, Employee.deleted_employees)
    # end.results
    ## End ##
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_url, notice: "#{@employee.name} was successfully created." }
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to @employee, notice: "#{@employee.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  # Reset deleted flag for soft delete
  def destroy
    @employee = Employee.find(params[:id])
    employee_name = @employee.name
    @employee.deleted = true
    @employee.deleted_at = Time.now
    @employee.save

    respond_to do |format|
      format.html { redirect_to employees_url, notice: "#{employee_name} was successfully deleted." }
      format.json { head :no_content }
    end
  end
  
end
