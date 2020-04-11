class GuestsController < ApplicationController

    def index
        @guests = Guest.all
        render json: @guests, include: [:household => {except: [:created_at, :updated_at]}], except: [:created_at, :updated_at, :address_id, :household_id]
    end

    def show
        @guest = Guest.find(params[:id])
        render json: @guest, include: [:household]
    end
    
    def create
        @guest = Guest.new(guest_params)

        if @guest.save
            render json: {message: 'Guest successfully added.', guest: @guest}, status: :created
        else
            render @guest.errors.messages
        end
    end

    def update
        @guest = Guest.find(params[:id])
        
        if @guest.update(guest_params)
            render json: {message: 'Guest successfully updated.', guest: @guest}, status: :ok
        else
            render @guest.errors.messages
        end
    end

    def destroy
        @guest = Guest.find(params[:id])
        
        if @guest.destroy
            render json: {message: 'Guest successfully deleted.'}, status: :ok
        else
            render @guest.errors.messages
        end
    end

    private

    def guest_params
        params.require(:guest).permit([:first_name,:last_name,:age,:email,:phone,:rsvp,:household_id])
    end
end