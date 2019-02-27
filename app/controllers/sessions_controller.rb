class SessionsController < ApplicationController
  
  def new
  end

  # ユーザ名のレコードがなければ
  # ユーザ名とパスワードがDBと一致していなければ戻す
  # 一致していればsign_inメソッドを実行
  def create
    user = User.find_by(name: session_params[:name])
    if user && user.authenticate(session_params[:password]) # authenticateで一致検証
      sign_in(user)
      redirect_to root_path # 管理画面がないのでとりあえずルートへ
    else
      render 'new'
      # ここにエラー処理書きたい
      # flashメソッド調べてみる
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end

  private
    def session_params
      params.require(:session).permit(:name, :password)
    end

    def sign_in(user)
      # Userモデルに書いたトークン生成のメソッド呼び出す
      remember_token = User.new_remember_token
      # Cookieにトークンをセット
      # cookies.permanentで20年クッキーらしい・・なぜ？
      cookies.permanent[:remember_token] = remember_token
      # updateメソッドでremember_tokenを書き換える
      # そのトークンはUserモデルに書いたハッシュ化メソッドでハッシュ化する
      user.update(remember_token: User.encrypt(remember_token))
      # @current_userにログインできたユーザをセット
      # これこのあとリダイレクトしても変数って渡っていくの？　消えるならここでセットする意味ない
      @current_user = user
    end

    def sign_out
      # Cookieからトークンを削除
      cookies.delete(:remember_token)
    end
end
