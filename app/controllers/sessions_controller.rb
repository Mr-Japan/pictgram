class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: email_params[:email])  #ストロングパラメータを使用
    # user = User.find_by(email: params[:session][:email])
      #↑ここで、フォームから送信されたメールアドレスを取得し、一致するユーザーがいるか検索しています。
    if user && user.authenticate(password_params[:password])   #ストロングパラメータを使用
    # if user && user.authenticate(params[:session][:password])
      #↑次にUserのパスワードが正しいかどうか確かめています。
      #「該当のメールアドレスをもつUserが存在している。かつUserのパスワードが正しい。」場合のみtrueになる条件式です。
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private
  def log_in(user)
   session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def email_params       #strong parameterであるpermitの設定
    params.require(:session).permit(:email)
  end
  
  def password_params
    params.require(:session).permit(:password)
  end
end