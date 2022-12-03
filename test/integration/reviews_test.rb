require "test_helper"

class ReviewsTest < ActionDispatch::IntegrationTest
  test "users who aren't logged in can't create reviews" do
     package = FactoryBot.create :package
     visit root_path
     
     click_on "Packages"
     click_on package.name
     click_on "View Reviews"
     click_on "Leave a Review"
     
     assert_text "The Flower Shop"
     
   end
end
