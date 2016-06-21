class UserValidation
  def validate(params)
    schema.call(params)
  end

  private

  def schema
    Dry::Validation.Schema do
      key(:name).required
      key(:email).required
    end
  end
end
