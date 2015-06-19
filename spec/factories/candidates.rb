FactoryGirl.define do
  factory :candidate, class: Candidate do
    trait :blank do
    end
    
    trait :full do
      date       Date.new(2015, 6, 28)
    end    
  end
end
