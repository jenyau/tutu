class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  layout "admin"

  protected

  def check_admin
    if current_user
      redirect_to root_path, alert: 'У вас нет прав для просмотра этой страницы' unless current_user.admin?
    else
      redirect_to new_user_session_path
    end
  end
end