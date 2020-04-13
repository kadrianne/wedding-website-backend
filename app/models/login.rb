class Login < ApplicationRecord
    has_secure_password
    belongs_to :household
end