class UsersController < ApplicationController
  layout 'authentication/layouts/application'

  @@user_validation = UserValidation.new

  def new
  end

  def create
    if @@user_validation.check_if_registered(user_params)
      return error_if_already_regitered
    end

    if @@user_validation.check_diff_password(user_params)
      return error_if_password_does_not_match
    end

    if @@user_validation.validate_user(user_params).messages.empty?
      user = User.new(user_params)
      user.username = SecureRandom.hex(10)

      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        render :new
        return
      end
    else
      flash[:validation] = @@user_validation.validate_user(user_params)
                                            .messages(locale: :'pt-BR')
      render :new
      return
    end
  end

  private

  def error_if_already_regitered
    flash[:alert] = 'Usuário já cadastrado!'
    render :new
    nil
  end

  def error_if_password_does_not_match
    flash[:alert] = 'Senha não confirmada!'
    render :new
    nil
  end

  def user_params
    params.require(:user).permit!
  end
end
