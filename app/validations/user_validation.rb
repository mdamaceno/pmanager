class UserValidation
  def schema
    Dry::Validation.Schema do
      configure { config.messages = :i18n }
      key(:name).required
      key(:email).required(:str?, format?: EMAIL_REGEX)
      # key(:password).required
      # key(:password_confirmation).required

      rule(password_presence: [:password, :password_confirmation]) do |pwd, pwdc|
        pwd.eql?(pwdc)
        pwd.size?(6..20)
      end

      key(:password).required do
        # min_size?(6)
        # max_size?(20)
      end

      key(:password_confirmation).required do
        min_size?(6)
        max_size?(20)
      end
    end
  end

  def validate_user(params)
    schema.call(params)
  end

  def check_if_registered(params)
    if User.find_by_email(params[:email]) || User.find_by_username(params[:username])
      return true
    end
  end

  def check_diff_password(params)
    return true if params[:password] != params[:password_confirmation]
  end
end
