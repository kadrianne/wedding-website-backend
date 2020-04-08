class Guest < ApplicationRecord
  belongs_to :household
  validates :first_name,:last_name,:email,:age, presence: true
  
end
