FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :customer do
  	sequence(:company) { |n| "Company #{n}}" }
  	sequence(:address1) { |n| "#{n} Main Street"}
  	sequence(:email) { |n| "company_#{n}@example.com"}
  end

  factory :project do
  	sequence(:name)  { |n| "Project #{n}" }
  	description "A good description"
  	customer
  end
end