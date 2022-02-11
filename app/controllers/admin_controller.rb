class AdminController < ApplicationController
  before_action :admin
  
  def admin
    unless current_user.admin
      render sessions_new_path, alert: 'ここから先は管理者以外は入れません'
    end
  end
  
  def index
    
  end
    
  def destroy_user
    
  end
  
  def destroy_topic
    
  end
  
end
  
