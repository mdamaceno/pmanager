class Authentication::UsersController < ApplicationController
  def new
  end

  def create
    respond_to do |_format|
      if validates.messages.empty?
        user = User.new(user_params)

        if user.save
          session[:user_id] = user.id
          _format.html { redirect_to '/' }
        else
          _format.html { redirect_to '/signup' }
        end
      else
        _format.html { redirect_to :signup, errors: validates.messages }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end

  def validates
    UserValidation.new.validate(user_params)
  end
end
