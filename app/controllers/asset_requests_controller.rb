class AssetRequestsController < ApplicationController
  before_filter :authenticate_user!

  # GET /asset_requests
  # GET /asset_requests.json
  def index
    @asset_requests = AssetRequest.paginate(:page => params[:page], :per_page => 1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asset_requests }
    end
  end

  # GET /asset_requests/1
  # GET /asset_requests/1.json
  def show
    @asset_request = AssetRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asset_request }
    end
  end

  # GET /asset_requests/new
  # GET /asset_requests/new.json
  def new
    @asset_request = AssetRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @asset_request }
    end
  end

  # GET /asset_requests/1/edit
  def edit
    @asset_request = AssetRequest.find(params[:id])
  end

  # POST /asset_requests
  # POST /asset_requests.json
  def create
    @asset_request = AssetRequest.new(params[:asset_request])

    respond_to do |format|
      if @asset_request.save
        format.html { redirect_to @asset_request, notice: 'Asset request was successfully created.' }
        format.json { render json: @asset_request, status: :created, location: @asset_request }
      else
        format.html { render action: "new" }
        format.json { render json: @asset_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /asset_requests/1
  # PUT /asset_requests/1.json
  def update
    @asset_request = AssetRequest.find(params[:id])

    respond_to do |format|
      if @asset_request.update_attributes(params[:asset_request])
        format.html { redirect_to @asset_request, notice: 'Asset request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @asset_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_requests/1
  # DELETE /asset_requests/1.json
  def destroy
    @asset_request = AssetRequest.find(params[:id])
    @asset_request.destroy

    respond_to do |format|
      format.html { redirect_to asset_requests_url }
      format.json { head :no_content }
    end
  end
end
