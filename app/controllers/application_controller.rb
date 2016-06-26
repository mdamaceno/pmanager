class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html

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
