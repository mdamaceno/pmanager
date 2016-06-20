module UserRepository
  def self.included(base)
    base.extend(ClassMethods)
  end
end
