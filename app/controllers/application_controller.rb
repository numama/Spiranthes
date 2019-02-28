class ApplicationController < ActionController::Base

  # この下の処理ってコントローラにかくやつなの・・？
  # モデルとかに書くんじゃないのかなあ

  # ログインしていなければログイン画面に飛ばされる処理
  def authentication
    redirect_to login_path unless logged_in?
  end

  # ログインしてるかどうかを判断
  # Cookieのトークンをハッシュ化したやつと一致するDBのユーザを探す
  def logged_in?
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user = User.find_by(remember_token: remember_token)
    @current_user.present?
  end

end
