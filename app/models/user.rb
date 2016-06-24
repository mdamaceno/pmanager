class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_secure_password

  def slug_candidates
    [:name, :username]
  end
end
