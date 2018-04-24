FactoryBot.define do
  factory :programming_language do

    trait :kotlin do
      code "kotlin"
    end

    trait :java do
      code "java"
    end

    trait :ruby do
      code "ruby"
    end

  end
end
