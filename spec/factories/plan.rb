FactoryGirl.define do
  factory :plan, class: Plan do
    trait :blank do
    end
    
    trait :full do
      title       "打ち合わせ"
      note        "次回プロジェクトの打ち合わせを行います"
    end
  end
end
