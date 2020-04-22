class Login < ApplicationRecord
    has_secure_password
    belongs_to :household
    validates :login_name, :password, :household_id, presence: {message: "%{attribute} cannot be blank."}
    validates :login_name, uniqueness: {case_sensitive: false, message: "Login name already exists."}
end