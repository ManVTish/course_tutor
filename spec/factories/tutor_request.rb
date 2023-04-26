# frozen_string_literal: true

FactoryBot.define do
  factory :tutor_req, class: "Tutor" do
    trait :tutor1 do
      {
        tutor_name: "HKS",
        expertise: "Electrical",
        degree: "Bachelor",
        yoe: 5
      }
    end

    trait :tutor2 do
      {
        tutor_name: "GR",
        expertise: "Web App",
        degree: "Masters",
        yoe: 10
      }
    end
  end
end