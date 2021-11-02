# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { Faker::Company.name }

    trait :requirement_satisfied do
      required_employees_count { 5 }
      employees_count { 5 }
      requirement_satisfied { true }
    end
  end
end
