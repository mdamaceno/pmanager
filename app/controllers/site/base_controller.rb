class Site::BaseController < ApplicationController
  respond_to :html

  layout 'site/layouts/application'

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to '/login', notice: 'Não é permitido acesso' unless current_user
  end

  def check_if_logged
    redirect_to '/', notice: 'Você já se encontra logado' unless current_user.nil?
  end
end
