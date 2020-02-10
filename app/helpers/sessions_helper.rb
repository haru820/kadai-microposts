module SessionsHelper
  def current_user
    #もし現在のUserがCurrent_userにいたらなにもしない、いなければ代入する
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    #!はNOTの意味　Not（Not current_user)という感じ　not(not true) = not false = true 問う感じ
    !!current_user
  end
end
