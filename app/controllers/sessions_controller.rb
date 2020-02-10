class SessionsController < ApplicationController
  def new
  end

  def create
    #session情報からparamsを拾ってくる
    email = params[:session][:email].downcase
    password = params[:session][:password]
    
    if login(email, password)
      flash[:success] = 'Yes welcome back, here!'
      redirect_to @user
    else
      flash[:danger] = 'Sorry,faile to log in...'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Log Out! See you again!'
    redirect_to root_url
  end


  private
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      #PC側はcookie、サーバはsessionとしてログイン情報を維持する
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end