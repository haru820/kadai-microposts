class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    set_user
    @microposts = @user.microposts.order(id: :desc).page(params[:page]).per(5)
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'Yay! You are in Microposts!!'
      redirect_to @user
    else
      flash.now[:danger] = 'Ops!! Registration Failed...'
      render :new
    end
  end
  
  #Private--------------------
  #---------------------------
  private
  def set_user
    @user = User.find(params[:id])
  end
  
  #Strong Parameter
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
