class MicropostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'Posted!!'
      redirect_to root_url
    else
      #失敗したときの再取得
      @microposts = current_user.feed_microposts.order(id: :desc).page(params[:page]).per(5)
      
      flash.now[:danger] = 'Ops!! Posting Failed...'
      render 'toppages/index'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = 'Post Deleted!!'
    redirect_back(fallback_location: root_path)
  end
  
  private
  #Strong Pamatetar
  def micropost_params
    params.require(:micropost).permit(:content)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
  end
  
end
