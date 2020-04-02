class Address < ApplicationRecord
  belongs_to :household
  has_many :guests
end
