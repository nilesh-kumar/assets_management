class ItemsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_item, :except => [:index, :new, :create, :stock, :faulty, :returned]

  # GET /items
  # GET /items.json
  def index
    @items = Item.valid_items.search(params[:search],params[:action]).order(sort_column('Item', 'name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit;end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    item = @item.name
    @item.deleted = true
    @item.deleted_at = Time.now
    @item.save

    respond_to do |format|
      format.html { redirect_to items_url, notice: "#{item} was successfully deleted." }
      format.json { head :no_content }
    end
  end
  
  # Items in stock
  def stock
    @items = Item.valid_items.stock.search(params[:search],params[:action]).order(sort_column('Item', 'name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # Faulty items
  def faulty
    @items = Item.valid_items.faulty.search(params[:search],params[:action]).order(sort_column('Item', 'name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # Returned items
  def returned
    @items = Item.valid_items.returned.search(params[:search],params[:action]).order(sort_column('Item', 'name') + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # To toggle stock flag
  def toggle_stock
    @item.toggle!(:stock)
  end

  # To toggle faulty flag
  def toggle_faulty
    @item.toggle!(:faulty)
  end

  # To toggle returned flag
  def toggle_returned
    @item.toggle!(:returned)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  private :find_item
end
