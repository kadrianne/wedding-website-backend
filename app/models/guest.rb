class Guest < ApplicationRecord
  belongs_to :household
  validates :first_name,:last_name, presence: true
  
end
