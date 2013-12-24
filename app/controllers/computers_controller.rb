class ComputersController < ApplicationController
  # GET /computers
  # GET /computers.json
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @computers = @vendor.computers.paginate(:page => params[:page], :per_page => 1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @computers }
    end
  end

  # GET /computers/1
  # GET /computers/1.json
  def show
    @vendor = Vendor.find(params[:vendor_id])
    @computer = @vendor.computers.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @computer }
    end
  end

  # GET /computers/new
  # GET /computers/new.json
  def new
    @vendor = Vendor.find(params[:vendor_id])
    @computer = Computer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @computer }
    end
  end

  # GET /computers/1/edit
  def edit
    @vendor = Vendor.find(params[:vendor_id])
    @computer = @vendor.computers.find(params[:id])
  end

  # POST /computers
  # POST /computers.json
  def create
    @vendor = Vendor.find(params[:vendor_id])
    @computer = @vendor.computers.new(params[:computer])

    respond_to do |format|
      if @computer.save
        format.html { redirect_to [@vendor, @computer], notice: "#{@computer.name} was successfully created." }
        format.json { render json: @computer, status: :created, location: @computer }
      else
        format.html { render action: "new" }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /computers/1
  # PUT /computers/1.json
  def update
    @vendor = Vendor.find(params[:vendor_id])
    @computer = @vendor.computers.find(params[:id])

    respond_to do |format|
      if @computer.update_attributes(params[:computer])
        format.html { redirect_to [@vendor, @computer], notice: "#{@computer.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers/1
  # DELETE /computers/1.json
  def destroy
    @vendor = Vendor.find(params[:vendor_id])
    @computer = @vendor.computers.find(params[:id])
    comp_name = @computer.name
    @computer.destroy

    respond_to do |format|
      format.html { redirect_to vendor_computers_url(@vendor), notice: "#{comp_name} was successfully deleted." }
      format.json { head :no_content }
    end
  end
end
