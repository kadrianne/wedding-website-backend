class LoginsController < ApplicationController

    def create
        @login = Login.create({
            login_name: params[:login_name],
            password: params[:password]
        })

        render json: {message: 'Login successfully created.'}, status: :created
    end
end
