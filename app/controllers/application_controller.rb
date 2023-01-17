class ApplicationController < ActionController::API
    before_action :authenticate_request

    private

        def authenticate_request
            header = request.headers["Authorization"]
            header = header.split(" ").last if header
            @decoded = JWT.decode(header)
            @current_imc = Imc.find(decoded[:imc_id])
        end
end
