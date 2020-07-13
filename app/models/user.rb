class User < ApplicationRecord
  validates :username, :email, :password,
            presence: true, length: { minimum: 3, maximum: 254 }
  validates :email, format: { with: /@/ },
                    uniqueness: { case_sensitive: false }

  before_save { email.downcase! }
end
