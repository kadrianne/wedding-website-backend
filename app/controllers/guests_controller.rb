class GuestsController < ApplicationController

    def index
        @guests = Guest.all
        render json: @guests, include: [:address => {except: [:created_at, :updated_at]}, :household => {except: [:created_at, :updated_at]}], except: [:created_at, :updated_at, :address_id, :household_id]
    end
    
    def create
        @guest = Guest.new(guest_params)

        if @guest.save
            render json: {message: 'Guest successfully added.', guest: @guest}, status: :created
        else
            render @guest.errors.messages
        end

    end

    private

    def guest_params
        params.require(:guest).permit([:first_name,:last_name,:age,:email,:phone,:rsvp,:household_id,:address_id])
    end
end