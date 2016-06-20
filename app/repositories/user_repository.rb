module UserRepository
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    # Put your methods here!
  end
end
