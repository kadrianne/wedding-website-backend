class Guest < ApplicationRecord
  belongs_to :household
  has_one :address
  validates :first_name,:last_name, presence: true
  
end
