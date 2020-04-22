class AddressesController < ApplicationController
    before_action :authenticate

    def index
        @addresses = Address.all
        render json: @addresses
    end

    def show
        @address = Address.find(params[:id])
        render json: @address
    end
    
    def create
        @address = Address.new(
            household_id: params[:household_id],
            street1: params[:street1],
            street2: params[:street2],
            city: params[:city],
            state: params[:state],
            zip: params[:zip],
            country: params[:country]
        )

        if @address.save
            render json: {message: 'Address created successfully.', address: @address}, status: :created
        else
            render json: @address.errors.messages
        end
    end
end
