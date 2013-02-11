FactoryGirl.define do
  factory :club do
    sequence(:name)  { |n| "Club #{n}" }
    sequence(:netname)  { |n| "club-#{n}" }
  end
end
