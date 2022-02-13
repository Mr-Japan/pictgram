class AdminController < ApplicationController
  before_action :admin
  
  def admin
    # if current_user.admin
    #   redirect_to admin_index_path, success: 'こちらは管理者画面です'
    # else
    #   flash.now[:danger] = "管理者以外アクセスできません"
    #   render "admin/index"
    # end
    unless current_user.admin
      render sessions_new_path, alert: "ここから先は管理者以外は入れません"
    end
  end
  
  def index
    @users = User.all
    @topics = Topic.all 
  end
    
  def destroy_user
    update_users = User.find_by(id: params[:id] )
    #binding.pry
    if update_users[:admin]
      redirect_to admin_path, danger: 'Adminは削除できません' and return
    end
    if update_users.delete
      redirect_to admin_path, success: 'Userの削除に成功しました'
    else
      redirect_to admin_path, danger: 'Userの削除に失敗しました'
    end
  end
  
  # def create_picture
  #   @picture = Picture.new(user_id:current_user.id, classwork_id:params[:id], **picture_params)
  #   #binding.pry
  #   if @picture.save
  #     redirect_to pictures_index_path, success: "画像の投稿に成功しました"  
  #   else
  #     flash.now[:danger] = "画像の投稿に失敗しました"
  #     render :new
  #   end
  # end
  
  
  def destroy_topic
    
  end
  
end
  
