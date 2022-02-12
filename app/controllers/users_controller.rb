class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    #@user= User.newがModelに該当する。
    #@user = User.new(name: params[:user][:name],email: params[:user][:email]) #9行目のストロングパラメータ型に変更
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
     #binding.pry
  end
  
  private
  def user_params       #strong parameterであるpermitの設定
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
     
end