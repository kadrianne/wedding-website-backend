class ApplicationController < ActionController::API
    def authenticate_login
        auth_header = request.headers["Authorization"]
        token = auth_header.split(" ")[1]
        secret_key = Rails.application.secret_key_base
        begin
            payload = JWT.decode(token,secret_key)[0]
            login_id = payload["login_id"]
            @login = Login.find(login_id)
            render json: @login
            if !@login
                render status: :unauthorized, json: {message: 'No user found'}
            end
        rescue
            render status: :unauthorized, json: {message: 'Error'}
        end
    end
end
