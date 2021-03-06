class InvoicesController < ApplicationController
  before_filter :authenticate_user!

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.search(params[:search],params[:action]).order(sort_column('Invoice', 'serial_number') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @invoice = Invoice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(params[:invoice])

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render json: @invoice, status: :created, location: @invoice }
      else
        format.html { render action: "new" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.json
  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def filter
    if !params[:cost].blank?
      @invoices = Invoice.where("cost >= ?" && "cost <= ?", params[:cost]).order(sort_column('Invoice', 'serial_number') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 1)
    elsif !params[:invoice].blank?
      @date = Date.civil(*params[:invoice].sort.map(&:last).map(&:to_i))
      @invoices = Invoice.where("DATE(created_at) >= ?" && "DATE(created_at) <= ?", @date.to_s).order(sort_column('Invoice', 'serial_number') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 1)
    else
      @invoices = Invoice.search(params[:search],params[:action]).order(sort_column('Invoice', 'serial_number') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 1)
    end
    render :action => 'index'
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end
end
