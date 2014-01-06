class DevicesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_vendors
  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.active.search(params[:search],params[:action]).order(sort_column("Device", 'name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @devices }
    end
  end

  # To filter devices based on selected vendor name #
  def filter
    if !params[:vendors].blank? and params[:vendors] != "All"
      @devices = Device.active.where(vendor_id: params[:vendors]).order(sort_column("Device", 'name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
    else
      @devices = Device.active.search(params[:search],params[:action]).order(sort_column("Device", 'name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @devices }
    end
  end

  # Devices in stock #
  def stock
    @devices = Device.active_and_stock.search(params[:search],params[:action]).order(sort_column("Device", 'name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @devices }
    end
  end

  # Scarp devices #
  def scrap
    @devices = Device.active_and_scrap.search(params[:search],params[:action]).order(sort_column("Device", 'name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @devices }
    end
  end

  # Faulty devices #
  def faulty
    @devices = Device.active_and_faulty.search(params[:search],params[:action]).order(sort_column("Device", 'name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @devices }
    end
  end

  # Returned devices #
  def returned
    @devices = Device.active_and_returned.search(params[:search],params[:action]).order(sort_column("Device", 'name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @devices }
    end
  end

  # InActive devices #
  def deleted
    @devices = Device.inactive.search(params[:search],params[:action]).order(sort_column("Device", 'name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @devices }
    end
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
    @device = Device.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device }
    end
  end

  # GET /devices/new
  # GET /devices/new.json
  def new
    @device = Device.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device }
    end
  end

  # GET /devices/1/edit
  def edit
    @device = Device.find(params[:id])
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(params[:device])

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: "#{@device.name} was successfully created." }
        format.json { render json: @device, status: :created, location: @device }
      else
        format.html { render action: "new" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /devices/1
  # PUT /devices/1.json
  def update
    @device = Device.find(params[:id])

    respond_to do |format|
      if @device.update_attributes(params[:device])
        format.html { redirect_to @device, notice: "#{@device.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device = Device.find(params[:id])
    name = @device.name
    @device.deleted = true
    @device.deleted_at = Time.now
    @device.save
    respond_to do |format|
      format.html { redirect_to devices_url, notice: "#{name} was successfully deleted." }
      format.json { head :no_content }
    end
  end

  # To toggle stock flag #
  def toggle_stock  
    @device = Device.find(params[:id])  
    @device.toggle!(:stock)  
  end 

  # To toggle stock flag #
  def toggle_deleted  
    @device = Device.find(params[:id])  
    @device.toggle!(:deleted)  
    @device.deleted_at = nil
    @device.save
    @devices = Device.inactive
  end

  # To toggle faulty flag #
  def toggle_faulty
    @device = Device.find(params[:id])  
    @device.toggle!(:faulty)  
  end

  # To toggle returned flag #
  def toggle_returned
    @device = Device.find(params[:id])  
    @device.toggle!(:returned) 
  end

  private
  def load_vendors
    @vendors = Vendor.all
  end
end
