class GuestsController < ApplicationController

    def index
        @guests = Guest.all
        render json: @guests, include: [:address => {except: [:created_at, :updated_at]}, :household => {except: [:created_at, :updated_at]}], except: [:created_at, :updated_at, :address_id, :household_id]
    end
    
end
