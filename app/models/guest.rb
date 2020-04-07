class Guest < ApplicationRecord
  belongs_to :household
  belongs_to :address
  
end
