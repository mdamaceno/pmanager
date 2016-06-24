class Authentication::UsersController < Authentication::BaseController
  def new
  end

  def create
    respond_to do |_format|
      if validates.messages.empty?
        user = User.new(user_params)
        user.username = SecureRandom.hex(10)

        if user.save
          session[:user_id] = user.id
          _format.html { redirect_to '/' }
        else
          _format.html { redirect_to '/signup' }
        end
      else
        _format.html { redirect_to '/signup', alert: validates.messages(locale: :'pt-BR') }
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
