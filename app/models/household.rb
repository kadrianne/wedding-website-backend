class Household < ApplicationRecord
    has_many :addresses
    has_many :guests
    has_one :login
end
