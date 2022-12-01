require "test_helper"

class UsersTest < ActionDispatch::IntegrationTest
   test "users can sign up" do
     visit root_path
     
     click_on "Sign Up"
     
     fill_in "Name", with: "Test Sign Up"
     fill_in "Email", with: "signup@test.com"
     fill_in "Password", with: "Secret"
     fill_in "Confirm Password", with: "Secret"
     
     click_button "Sign Up"
     
     assert_equal page.current_path, root_path
     #assert_text "signed up"
     
     assert_text "Log Out"
     refute page.has_content?("Login")
     
   end
   
   
   
   
   test "user cannot sign up with errors" do
     visit signup_path
    
     fill_in "Name", with: "Test Sign Up"
     fill_in "Email", with: "signupest.com" #no @ sign in the email
     fill_in "Password", with: "Secret"
     fill_in "Confirm Password", with: "Secret"
    
     click_button "Sign Up"
     
     assert_text "Sign Up"
  
   
   end
   
   
end
