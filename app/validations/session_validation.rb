class SessionValidation
  def validate(params = {})
    schema.call(params)
  end

  def check_if_logged
    true unless session[:user_id].nil?
  end

  private

  def schema
    Dry::Validation.Schema do
      configure { config.messages = :i18n }
      key(:email).required(:str?, format?: EMAIL_REGEX)
      key(:password).required(gteq?: 6, lteq?: 20)

      rule(password_presence: [:password, :password_confirmation]) do |pwd, pwdc|
        pwd.filled?.then(pwdc.filled?)
      end
    end
  end
end
