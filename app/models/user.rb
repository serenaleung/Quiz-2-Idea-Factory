class User < ApplicationRecord
  has_many :ideas, dependent: :nullify
  has_many :reviews, dependent: :nullify

  has_secure_password

  validates(:first_name, { presence: true })
  validates(:last_name, { presence: true })
  validates(:email, { presence: true, uniqueness: true })
end
