class UserValidation
  def validate(params)
    schema.call(params)
  end

  private

  def schema
    Dry::Validation.Form do
      configure { config.messages = :i18n }
      key(:name).required
      key(:email).required(:str?, format?: EMAIL_REGEX)
      key(:password).required(:str?, min_size?: 6, max_size?: 20)
      key(:password_confirmation).required(:str?, min_size?: 6, max_size?: 20)
    end
  end
end
