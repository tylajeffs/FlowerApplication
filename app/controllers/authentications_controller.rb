class AuthenticationsController < ApplicationController
    
    def create
        render json: auth_hash
    end
    
    
    
    private
    
    
    def auth_hash
        request.env['omniauth.auth']
        
    end
    
end
