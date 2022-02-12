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
    
  end
  
  def destroy_topic
    
  end
  
end
  
