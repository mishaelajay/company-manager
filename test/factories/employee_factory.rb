FactoryBot.define do
    factory :employee do
        trait :with_company do
            company { create(:company) }
        end
    end
end