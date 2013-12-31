class ClientAssetsController < ApplicationController
  helper_method :sort_column, :sort_direction  
  before_filter :load_computers, :load_employees
  # GET /client_assets
  # GET /client_assets.json
  def index
    @client_assets = ClientAsset.current_client_assets.search(params[:search],params[:action]).order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @client_assets }
    end
  end

  # List of recently joined employees
  def deleted
    @client_assets = ClientAsset.deleted_client_assets.search(params[:search],params[:action]).order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)
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
    elsif params[:client_asset][:referenceable_type] == "Computer"
      @reference = Computer.find(params[:computers])
    end
    #@client_asset = ClientAsset.new(params[:client_asset])
    @client_asset = @reference.client_assets.build(params[:client_asset])

    respond_to do |format|
      if @client_asset.save
        format.html { redirect_to @client_asset, notice: 'Client asset was successfully created.' }
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
    elsif params[:client_asset][:referenceable_type] == "Computer"
      @client_asset.referenceable_id = params[:computers]
    end
    @client_asset.referenceable_id = params[:computers]
    respond_to do |format|
      if @client_asset.update_attributes(params[:client_asset])
        format.html { redirect_to @client_asset, notice: 'Client asset was successfully updated.' }
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
    @client_asset.deleted = true
    @client_asset.deleted_at = Time.now
    @client_asset.save
    #@client_asset.destroy

    respond_to do |format|
      format.html { redirect_to client_assets_url }
      format.json { head :no_content }
    end
  end

  private

  def load_computers
    @computers = Computer.all
  end

  def load_employees
    @employees = Employee.current_employees.order(:name)
  end

  def sort_column  
    ClientAsset.column_names.include?(params[:sort]) ? params[:sort] : "client_name"
  end  
    
  def sort_direction  
     %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end 
end
