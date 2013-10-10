FactoryGirl.define do
  factory :user do |f|
    f.name "foo"  
    f.password "foobar"  
    f.password_confirmation { |u| u.password }  
    f.email "foo@example.com"
  end    
end  