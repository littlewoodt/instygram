class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find params[:id]
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.create user_params
  	redirect_to users_path
  end

  def edit
  	@user = @current_user
  end

  def update
  	user = @current_user
  	user.update user_params
  	redirect_to users_path
  end

  def destroy
  	user = User.find params[:id] # maybe change
  	user = user.destroy
  	redirect_to users_path
  end

  def followed
    @followed = @current_user.active_relationships
    render :followed
  end

  def follow
    @current_user.active_relationships.create(followed_id: params[:id])
    redirect_to followed_path
  end

  def unfollow
    @current_user.active_relationships.find_by(followed_id: params[:id]).destroy
    redirect_to followed_path
  end

  private
  def user_params
  	params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end
end
