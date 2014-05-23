class PoolGroupsController < ApplicationController
  before_action :set_pool_group, only: [:show, :edit, :update, :destroy]

  # GET /pool_groups
  # GET /pool_groups.json
  def index
    @pool_groups = PoolGroup.all
  end

  # GET /pool_groups/1
  # GET /pool_groups/1.json
  def show
  end

  # GET /pool_groups/new
  def new
    @pool_group = PoolGroup.new
  end

  # GET /pool_groups/1/edit
  def edit
  end

  # POST /pool_groups
  # POST /pool_groups.json
  def create
    @pool_group = PoolGroup.new(pool_group_params)

    respond_to do |format|
      if @pool_group.save
        format.html { redirect_to @pool_group, notice: 'Pool group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pool_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @pool_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pool_groups/1
  # PATCH/PUT /pool_groups/1.json
  def update
    respond_to do |format|
      if @pool_group.update(pool_group_params)
        format.html { redirect_to @pool_group, notice: 'Pool group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pool_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pool_groups/1
  # DELETE /pool_groups/1.json
  def destroy
    @pool_group.destroy
    respond_to do |format|
      format.html { redirect_to pool_groups_url }
      format.json { head :no_content }
    end
  end

  def poolview
    @wishid = params[:wishid]
    @members = params[:members]
    #render 'wishlists/claim'
  end
helper_method :poolview
  def chat
    @content = params[:q]
    @members = params[:members]
    @wishid = params[:wishid]
    @itemm = @friends
    w = Wishlist.find_by_id(@wishid)
     PoolGroup.create(:wishlist_id => w.id, :user_id => current_user.id, :poolers => w.poolers, :content => " #{@content}")
     # PoolGroups.poolview(:wishid => @wishid, :@members => @members, :@itemm => @itemm)
     session[:return_to] ||= request.referer
     #redirect_to session.delete(:return_to)
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pool_group
      @pool_group = PoolGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pool_group_params
      params.require(:pool_group).permit(:poolers)
    end

end
