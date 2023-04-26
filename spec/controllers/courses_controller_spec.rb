# frozen_string_literal: true
require 'rails_helper'

RSpec.describe "Courses and it's tutors API", type: :request do
  context "POST /courses endpoint" do
    before(:each) do
      # @course_req = build(:course_req, :course)
      # @tutor_req = [ build(:tutor_req, :tutor1), build(:tutor_req, :tutor2) ]

      post "/courses", params: { course: {
        "course_name": "Computer Science",
        "skill": "programming",
        "fee": 150,
        "tutor_details": [
          {
            "tutor_name": "HKS",
            "expertise": "Electrical",
            "degree": "Bachelor",
            "yoe": 5
          },
          {
            "tutor_name": "GR",
            "expertise": "Web App",
            "degree": "Masters",
            "yoe": 10
          }
        ]
      } }
    end

    it 'create new course & it\'s tutors' do
      json_response = JSON.parse(response.body)
      expect(json_response["success"]).to match(true)
      expect(json_response["msg"]).to match("Course created successful")
      expect(Course.all.count).to match(1)
      expect(Tutor.all.count).to match(2)
    end

    context "GET /courses endpoint" do
      before do
        get "/courses", xhr: true
      end

      it 'index course & it\'s tutors' do
        json_response = JSON.parse(response.body)
        expect(response.status).to match(200)
        expect(json_response.present?).to match(true)
      end
    end
  end
end
