class ToppagesController < ApplicationController
  def index
    if logged_in?
      @micropost = current_user.microposts.build #Form_with用に空のインスタンスを代入
      #成功（れぢれct)もしくは初めて表示するときの一覧　　--Create失敗じは身croposts_controllerから一覧が来る（Perを変えてみるとわかる）
      @microposts = current_user.microposts.order(id: :desc).page(params[:page]).per(5)
      
    end
  end
end
