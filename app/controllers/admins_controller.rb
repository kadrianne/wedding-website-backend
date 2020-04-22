class AdminsController < ApplicationController
    before_action :authenticate, only: [:create]

    def create
        @admin = Admin.new({
            username: params[:username],
            password: params[:password]
        })

        if @admin.save
            render json: {message: 'Admin successfully created.', admin: @admin}, status: :created
        else
            render json: @admin.errors.messages
        end
    end

    def login
        @admin = Admin.find_by(username: params[:username].downcase)

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
                render json: {message: 'User logged in.', admin: @admin, token: token}, status: :accepted
            end
        end
    end

end
