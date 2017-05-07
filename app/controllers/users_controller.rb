class UsersController < ApplicationController

before_action :authenticate_user!, :except => [:show]
before_action :admin_user,  only: :destroy

  def index
#    @user = User.all
    @users = User.paginate(page: params[:page], per_page: 10 )

  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  private
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
  
  
end

