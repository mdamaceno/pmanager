class UserValidation
  def validate(params)
    schema.call(params)
  end

  private

  def schema
    Dry::Validation.Schema do
      key(:name).required
      key(:email).required(:str?, :email?)

      configure { config.messages_file = "#{Rails.root}/config/locales/en.yml" }
      configure do
        def email?(value)
          !/\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.match(value).nil?
        end
      end
    end
  end

  def valid_email_regex
    /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  end
end
