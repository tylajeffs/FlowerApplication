module AuthenticationMacros
    
    def login_user(user_properties = {})
        user = FactoryBot.create :user, user_properties
        visit login_path
        
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        
        click_button "Log in"
        
        user
        
    end
    
    def reset_login
        reset_session!
    end
    
end