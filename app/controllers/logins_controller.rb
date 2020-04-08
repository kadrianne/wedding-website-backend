class LoginsController < ApplicationController

    def create
        @login = Login.create({
            login_name: params[:login_name],
            password: params[:password]
        })

        render json: {message: 'Login successfully created.'}, status: :created
    end

    def login
        @login = Login.find_by(login_name: params[:login_name].downcase)

        if !@login
            render json: {message: 'Please enter a valid login name.'}, status: :unauthorized
        else
            if !@login.authenticate(params[:password])
                render json: {message: 'Please enter a valid password.'}, status: :unauthorized
            else
                payload = {
                    login_id: @login.id
                }
                secret_key = Rails.application.secret_key_base
                token = JWT.encode(payload,secret_key)
                render json: {message: 'User logged in.', login: @login}, status: :accepted
            end
        end
    end
end
