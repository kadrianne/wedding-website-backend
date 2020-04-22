class ApplicationController < ActionController::API
    def authenticate
        auth_header = request.headers["Authorization"]
        token = auth_header.split(" ")[1]
        secret_key = Rails.application.secret_key_base
        begin
            payload = JWT.decode(token,secret_key)[0]
            if payload["login_id"] != nil
                login_id = payload["login_id"]
                @login = Login.find(login_id)
                if !@login
                    render status: :unauthorized, json: {message: 'No user found'}
                end
            elsif payload["admin_id"] != nil
                admin_id = payload["admin_id"]
                @admin = Admin.find(admin_id)
                if !@admin
                    render status: :unauthorized, json: {message: 'No user found'}
                end
            end
        rescue
            render status: :unauthorized, json: {message: 'Error'}
        end
    end
end
