class HouseholdsController < ApplicationController

    def index
        @households = Household.all
        render json: @households, include: [:guests, :addresses]
    end

    def show
        @household = Household.find(params[:id])
        render json: @household, include: [:guests, :addresses]
    end
    
    def create
        @household = Household.create(
            family: params[:family],
            region: params[:region]
        )

        render json: {message: 'Household successfully added!', household: @household}, status: :created
    end
end
