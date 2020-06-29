class User < ApplicationRecord
  validates :username, :email, :password,
            presence: true, length: { minimum: 3, maximum: 254 }
  validates :password,
            format: {
              with: /^(?=.\d)(?=.([a-z]|[A-Z]))([\x20-\x7E]){6,40}$/,
              multiline: true
            }
  validates :email, format: { with: /@/ },
                    uniqueness: { case_sensitive: false }

  before_save { email.down_case! }
end
