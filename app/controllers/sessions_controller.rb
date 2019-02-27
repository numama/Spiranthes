class SessionsController < ApplicationController
  
  def new
  end

  # 現状： ユーザ名のレコードがなければ戻す
  # ユーザ名とパスワードがDBと一致していなければ戻す
  # 一致していればリダイレクト、一致判定のときにすでにSessionが埋め込まれてる・・？
  def create
    if @user = User.find_by(name: session_params[:name])
      if @user.authenticate(session_params[:password])
        # sign_in(@user)
        redirect_to root_path
      else
        render 'new'
      end
    else
      render 'new'
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

end
