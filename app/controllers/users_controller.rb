class CollectionController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /collection
  # GET /collection.json
  def index
    @collection = User.all
  end

  # GET /collection/1
  # GET /collection/1.json
  def show
  end

  # GET /collection/new
  def new
    @user = User.new
  end

  # GET /collection/1/edit
  def edit
  end

  # POST /collection
  # POST /collection.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collection/1
  # PATCH/PUT /collection/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collection/1
  # DELETE /collection/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to collection_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_id, :stamp_id)
    end
end
