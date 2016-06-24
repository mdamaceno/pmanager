class SessionsController < ApplicationController
  layout 'authentication/layouts/application'

  def new
  end

  def create
    respond_to do |_format|
      if validates.messages.empty?
        user = User.find_by_email(params[:email])
        # If the user exists AND the password entered is correct.
        if user && user.authenticate(params[:password])
          # Save the user id inside the browser cookie. This is how we keep the user
          # logged in when they navigate around our website.
          session[:user_id] = user.id
          _format.html { redirect_to '/' }
        else
          # If user's login doesn't work, send them back to the login form.
          _format.html { redirect_to '/login' }
        end
      else
        _format.html { redirect_to '/login', alert: validates.messages(locale: :'pt-BR') }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |_format|
      _format.html { redirect_to '/login' }
    end
  end

  private

  def validates
    SessionValidation.new.validate(email: params[:email], password: params[:password])
  end
end
