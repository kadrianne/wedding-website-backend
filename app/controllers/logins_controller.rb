class LoginsController < ApplicationController
    before_action :authenticate, only: [:create]

    def create
        @login = Login.new({
            login_name: params[:login_name],
            password: params[:password],
            household_id: params[:household_id]
        })

        if @login.save
            render json: {message: 'Login successfully created.', login: @login}, status: :created
        else
            render json: @login.errors.messages
        end
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
                render json: {message: 'User logged in.', login: @login, token: token}, status: :accepted
            end
        end
    end

    def get_payload
        auth_header = request.headers["Authorization"]
        token = auth_header.split(" ")[1]
        secret_key = Rails.application.secret_key_base
        begin
            payload = JWT.decode(token,secret_key)[0]
            if payload["login_id"] != nil
                login_id = payload["login_id"]
                @login = Login.find(login_id)

                render json: @login
                if !@login
                    render status: :unauthorized, json: {message: 'No user found'}
                end
            end
        rescue
            render status: :unauthorized, json: {message: 'Error'}
        end
    end

end
