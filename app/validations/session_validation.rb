class SessionValidation
  def validate(params = {})
    schema.call(params)
  end

  private

  def schema
    Dry::Validation.Schema do
      configure { config.messages = :i18n }
      key(:email).required(:str?, format?: EMAIL_REGEX)
      key(:password).required
    end
  end
end
