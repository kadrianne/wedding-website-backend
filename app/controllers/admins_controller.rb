class AdminsController < ApplicationController

    def create
        @admin = Admin.create({
            username: params[:username],
            password: params[:password]
        })

        render json: @admin
    end

    def login
        @admin = Admin.find_by(username: params[:username])

        if !@admin
            render json: {message: 'Please enter a valid username.'}, status: :unauthorized
        else
            if !@admin.authenticate(params[:password])
                render json: {message: 'Please enter a valid password.'}, status: :unauthorized
            else
                payload = {
                    admin_id: @admin.id
                }
                secret_key = Rails.application.secret_key_base
                token = JWT.encode(payload,secret_key)
                render json: {message: 'User logged in.', admin: @admin}, status: :accepted
            end
        end
    end

end
