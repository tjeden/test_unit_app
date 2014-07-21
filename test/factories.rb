FactoryGirl.define do
  factory :product do
    title { |n| "Product number: #{n}" }
    price 19.99
    description "Some description"
  end
end
