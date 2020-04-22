class Admin < ApplicationRecord
    has_secure_password
    validates :username, :password, presence: {message: "%{attribute} cannot be blank."}
    validates :username, uniqueness: {case_sensitive: false, message: "Username already exists."}
end
