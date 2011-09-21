class ItemsController < ApplicationController
  before_filter :require_login
  # GET /items
  # GET /items.json
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new(:list_id => params[:list_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to lists_path, :notice => 'Item was successfully created.' }
        format.json { render :json => lists_path, :status => :created, :location => lists_path }
      else
        format.html { render :action => "new" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to lists_path, :notice => 'Item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to lists_url }
      format.json { head :ok }
    end
  end
  
  def hide
    @item = Item.find(params[:id])
    @item.update_attributes(:visible => false)

    respond_to do |format|
      format.html { redirect_to lists_url, :notice => "Item destoyed.#{undo_item_destroing}"} 
      format.json { head :ok }
    end
  end
  
  private
  
  def undo_item_destroing
    view_context.link_to "Undo", item_path(params[:id], :item => {:visible => true}), :method => :put
  end
end
