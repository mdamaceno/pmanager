class SessionValidation
  def schema
    Dry::Validation.Schema do
      configure { config.messages = :i18n }
      key(:email).required(:str?) do
        format? EMAIL_REGEX
      end
      key(:password).required(:str?)
    end
  end

  def validate(params = {})
    schema.call(params)
  end

  def check_if_logged
    true unless session[:user_id].nil?
  end
end
