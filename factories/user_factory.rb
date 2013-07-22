#Factory.define :user do |user|
#  user.sequence(:email) { |n| "user#{n}@ticketee.com" }
#  user.password "password"
#  user.password_confirmation "password"
#end

Factory.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@ticketee.com" }
    password "password"
    password_confirmation "password"
  end
end