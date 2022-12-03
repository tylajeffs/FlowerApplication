FactoryBot.define do
    factory :user do |f|
        f.sequence(:name) { |n| "Test User#{n}" }
        f.sequence(:email) { |n| "test#{n}@account.com" }
        f.password { "password" }
        f.password_confirmation { |d| d.password }
        
    end
    
    factory :package do |f|
        f.sequence(:name) { |n| "peonies#{n}" }
        f.description { "this is a flower package" }
        f.price { 30 }
        
    end
end