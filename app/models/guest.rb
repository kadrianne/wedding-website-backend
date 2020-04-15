class Guest < ApplicationRecord
  belongs_to :household
  has_one :address
  validates :first_name, :last_name, :household, presence: true
  
end
