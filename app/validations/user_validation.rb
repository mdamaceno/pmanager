class UserValidation
  def validate(params)
    schema.call(params)
  end

  private

  def schema
    Dry::Validation.Schema do
      configure { config.messages = :i18n }
      configure do
        def email?(value)
          !/\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.match(value).nil?
        end
      end

      key(:name).required
      key(:email).required(:str?, :email?)
    end
  end
end
