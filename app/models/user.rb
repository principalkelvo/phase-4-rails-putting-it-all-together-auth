class User < ApplicationRecord
    validates :username, presence: true, uniqueness:
    has_secure_password
    has_many :recipes
end
