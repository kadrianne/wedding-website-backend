class Guest < ApplicationRecord
  belongs_to :household
  belongs_to :address
  validates :first_name, :last_name, :household, presence: true
  
end
