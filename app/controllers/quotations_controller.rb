class QuotationsController < ApplicationController
  # GET /quotations
  # GET /quotations.json
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @quotations = Quotation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @quotations }
    end
  end

  # GET /quotations/1
  # GET /quotations/1.json
  def show
    @vendor = Vendor.find(params[:vendor_id])
    @quotation = @vendor.quotations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @quotation }
    end
  end

  # GET /quotations/new
  # GET /quotations/new.json
  def new
    @vendor = Vendor.find(params[:vendor_id])
    @quotation = Quotation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @quotation }
    end
  end

  # GET /quotations/1/edit
  def edit
    @vendor = Vendor.find(params[:vendor_id])
    @quotation = @vendor.quotations.find(params[:id])
  end

  # POST /quotations
  # POST /quotations.json
  def create
    @vendor = Vendor.find(params[:vendor_id])
    @quotation = @vendor.quotations.new(params[:quotation])

    respond_to do |format|
      if @quotation.save
        format.html { redirect_to [@vendor, @quotation], notice: 'Quotation was successfully created.' }
        format.json { render json: @quotation, status: :created, location: @quotation }
      else
        format.html { render action: "new" }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /quotations/1
  # PUT /quotations/1.json
  def update
    @vendor = Vendor.find(params[:vendor_id])
    @quotation = @vendor.quotations.find(params[:id])

    respond_to do |format|
      if @quotation.update_attributes(params[:quotation])
        format.html { redirect_to [@vendor, @quotation], notice: 'Quotation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotations/1
  # DELETE /quotations/1.json
  def destroy
    @vendor = Vendor.find(params[:vendor_id])
    @quotation = @vendor.quotations.find(params[:id])
    @quotation.destroy

    respond_to do |format|
      format.html { redirect_to vendor_quotations_url(@vendor) }
      format.json { head :no_content }
    end
  end
end
