class ClientAssetsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_computers, :load_employees, :load_devices
  # GET /client_assets
  # GET /client_assets.json
  def index
    @client_assets = ClientAsset.active_client_assets.search(params[:search],params[:action]).order(sort_column("ClientAsset", 'client_name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @client_assets }
    end
  end

  # List of deleted client assets
  def deleted
    @client_assets = ClientAsset.inactive_client_assets.search(params[:search],params[:action]).order(sort_column("ClientAsset", 'client_name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @client_assets }
    end
  end

  # GET /client_assets/1
  # GET /client_assets/1.json
  def show
    @client_asset = ClientAsset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client_asset }
    end
  end

  # GET /client_assets/new
  # GET /client_assets/new.json
  def new
    @client_asset = ClientAsset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client_asset }
    end
  end

  # GET /client_assets/1/edit
  def edit
    @client_asset = ClientAsset.find(params[:id])
  end

  # POST /client_assets
  # POST /client_assets.json
  def create
    if params[:client_asset][:referenceable_type] == "Asset"
     # Fetch asset from Asset model
    elsif params[:client_asset][:referenceable_type] == "Device"
      @reference = Device.find(params[:device_id])
    elsif params[:client_asset][:referenceable_type] == "Computer"
      @reference = Computer.find(params[:computer_id])
    end
    #@client_asset = ClientAsset.new(params[:client_asset])
    @client_asset = @reference.client_assets.build(params[:client_asset])

    respond_to do |format|
      if @client_asset.save
        format.html { redirect_to @client_asset, notice: "#{@client_asset.client_name}'s asset was successfully created." }
        format.json { render json: @client_asset, status: :created, location: @client_asset }
      else
        format.html { render action: "new" }
        format.json { render json: @client_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /client_assets/1
  # PUT /client_assets/1.json
  def update
    @client_asset = ClientAsset.find(params[:id])
    if params[:client_asset][:referenceable_type] == "Asset"
     # Fetch asset from Asset model
    elsif params[:client_asset][:referenceable_type] == "Device"
      @client_asset.referenceable_id = params[:device_id]
    elsif params[:client_asset][:referenceable_type] == "Computer"
      @client_asset.referenceable_id = params[:computer_id]
    end
   
    respond_to do |format|
      if @client_asset.update_attributes(params[:client_asset])
        format.html { redirect_to @client_asset, notice: "#{@client_asset.client_name}'s asset was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_assets/1
  # DELETE /client_assets/1.json
  def destroy
    @client_asset = ClientAsset.find(params[:id])
    client_name = @client_asset.client_name
    @client_asset.deleted = true
    @client_asset.deleted_at = Time.now
    @client_asset.save
    #@client_asset.destroy

    respond_to do |format|
      format.html { redirect_to client_assets_url, notice: "#{client_name}'s asset was successfully deleted." }
      format.json { head :no_content }
    end
  end

end
