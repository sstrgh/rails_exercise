FactoryBot.define do
  factory :language do

    trait :english do
      code "en"
    end

    trait :vietnamese do
      code "vn"
    end

    trait :french do
      code "fr"
    end

  end
end
