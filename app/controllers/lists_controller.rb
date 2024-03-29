class ListsController < ApplicationController
  before_filter :require_login
  # GET /lists
  # GET /lists.json
  def index
    @lists = List.find_all_by_user_id(current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @lists }
    end
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    #@list = List.find(params[:id])
    @list ||= current_user.lists.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @list }
    end
  end

  # GET /lists/new
  # GET /lists/new.json
  def new
    @list ||= current_user.lists.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @list }
    end
  end

  # GET /lists/1/edit
  def edit
    @list ||= current_user.lists.find(params[:id])
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = User.find(current_user).lists.new(params[:list])

    respond_to do |format|
      if @list.save
        format.html { redirect_to lists_path, :notice => 'List was successfully created.' }
        format.json { render :json => lists_path, :status => :created, :location => lists_path }
      else
        format.html { render :action => "new" }
        format.json { render :json => @list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lists/1
  # PUT /lists/1.json
  def update
    @list ||= current_user.lists.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to lists_path, :notice => 'List was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list ||= current_user.lists.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url, :notice => "Destoyed" }
      format.json { head :ok }
    end
  end
  
  def hide
    @list ||= current_user.lists.find(params[:id])
    @list.update_attributes(:visible => false)

    respond_to do |format|
      format.html { redirect_to lists_url, :notice => "Destoyed.#{undo_list_destroing}"} 
      format.json { head :ok }
    end
  end
  
  private
  
  def undo_list_destroing
    view_context.link_to "Undo", list_path(params[:id], :list => {:visible => true}), :method => :put
  end
  
end
