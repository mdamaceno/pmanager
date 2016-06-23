class Authentication::UsersController < ApplicationController
  def new
  end

  def create
    if validates.messages.empty?
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    else
      render action: 'new'
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
