class EmployeeAssociationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_computers, :load_employees, :load_devices
  # GET /employee_associations
  # GET /employee_associations.json
  def index
    @employee_associations = EmployeeAssociation.paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employee_associations }
    end
  end

  # GET /employee_associations/1
  # GET /employee_associations/1.json
  def show
    @employee_association = EmployeeAssociation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employee_association }
    end
  end

  # GET /employee_associations/new
  # GET /employee_associations/new.json
  def new
    @employee_association = EmployeeAssociation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employee_association }
    end
  end

  # GET /employee_associations/1/edit
  def edit
    @employee_association = EmployeeAssociation.find(params[:id])
  end

  # POST /employee_associations
  # POST /employee_associations.json
  def create
    if params[:employee_association][:associable_type] == "Device"
      @association = Device.find(params[:device_id])
    elsif params[:employee_association][:associable_type] == "Computer"
      @association = Computer.find(params[:computer_id])
    end
    @employee_association = @association.employee_associations.build(params[:employee_association])
    #@employee_association = EmployeeAssociation.new(params[:employee_association])

    respond_to do |format|
      if @employee_association.save
        format.html { redirect_to @employee_association, notice: 'Employee association was successfully created.' }
        format.json { render json: @employee_association, status: :created, location: @employee_association }
      else
        format.html { render action: "new" }
        format.json { render json: @employee_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employee_associations/1
  # PUT /employee_associations/1.json
  def update
    @employee_association = EmployeeAssociation.find(params[:id])
    
    if params[:employee_association][:associable_type] == "Device"
      @employee_association.associable_id = params[:device_id]
    elsif params[:employee_association][:associable_type] == "Computer"
      @employee_association.associable_id = params[:computer_id]
    end

    respond_to do |format|
      if @employee_association.update_attributes(params[:employee_association])
        format.html { redirect_to @employee_association, notice: 'Employee association was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employee_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_associations/1
  # DELETE /employee_associations/1.json
  def destroy
    @employee_association = EmployeeAssociation.find(params[:id])
    @employee_association.destroy

    respond_to do |format|
      format.html { redirect_to employee_associations_url }
      format.json { head :no_content }
    end
  end

end
