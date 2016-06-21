class UserValidation
  def validate(params)
    schema.call(params)
  end

  private

  def schema
    Dry::Validation.Schema do
      configure { config.messages = :i18n }
      key(:name).required
      key(:email).required(:str?, format?: EMAIL_REGEX)
    end
  end
end
