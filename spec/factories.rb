FactoryGirl.define do
  factory :user do
    name "foo"  
    password "foobar"  
    password_confirmation { |u| u.password }  
    sequence(:email) { |n| "person#{n}@gmail.com" }
  end 

  factory :category do
    name "ruby"
    slug "ruby"
  end 

  factory :tutorial do
    description "heres a new tutorial"
    link "hello.com"
    user
    category
  end  
end  