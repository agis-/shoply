FactoryGirl.define do
  factory :vendor do
    name     "A Supermarket"
    email    "michael@example.com"
    username "some-supermarket"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :offer do
    title         "Example Offer"
    price         15.25
    initial_price 16.55
    starts_on     Date.today
    expires_on    Date.today + 3
    vendor
    category
  end

  factory :city do
    name 'Example city'
  end

  factory :category do
    title 'A category'
  end
end