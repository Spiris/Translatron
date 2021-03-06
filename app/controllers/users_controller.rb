class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to url: { action: 'show' }, id: @user
    else
      render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @messages = Message.all;
  end
  
  def index
    @users = User.all
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :language)
  end
end