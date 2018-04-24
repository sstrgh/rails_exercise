FactoryBot.define do
  factory :programming_language do

    trait :kotlin do
      name "kotlin"
    end

    trait :java do
      name "java"
    end

    trait :ruby do
      name "ruby"
    end

  end
end
