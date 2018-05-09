class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    # @users = User.all
    @users = User.order(sort_column + " " + sort_direction)
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        data = user_params.merge({id: @user.id.to_s})
        ActionCable.server.broadcast 'create_channel', data

        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        data = user_params.merge({id: @user.id.to_s})
        ActionCable.server.broadcast 'update_channel', data

        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    data = {id: @user.id.to_s}
    @user.destroy
    ActionCable.server.broadcast 'destroy_channel', data
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def sort_column
    User.fields.collect { |field| field[0] }.include?(params[:sort]) ? params[:sort] : "last_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
