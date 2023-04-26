# frozen_string_literal: true

FactoryBot.define do
  factory :course_tutor_res, class: "Course" do
    trait :course_api do
      {
        "course_name": "Computer Science",
        "skill": "programming",
        "fee": 150
      }
    end
  end
end
