# frozen_string_literal: true

FactoryBot.define do
  factory :course_req, class: "Course" do
    trait :course do
      {
        "course_name": "Computer Science",
        "skill": "programming",
        "fee": 150
      }
    end
  end
end
