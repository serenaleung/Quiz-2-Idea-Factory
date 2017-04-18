class User < ApplicationRecord
  has_many :ideas, dependent: :nullify
  has_many :reviews

  has_secure_password
end
