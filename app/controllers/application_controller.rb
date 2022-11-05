class ApplicationController < ActionController::Base
    
    
    
    private
    
    
    
    def login(user)
        session[:user_id] = user.id
    end
    
    def logout(user)
        session[:user_id] = nil
    end
end
