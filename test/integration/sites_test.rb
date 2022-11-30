require "test_helper"

class SitesTest < ActionDispatch::IntegrationTest
   test "home page works" do
     visit root_path
     
     assert_selector "h1", text: "The Flower Shop"
   end
   
   test "about page works" do
     visit about_path
     
     assert_selector "h1", text: "About"
   end
end
