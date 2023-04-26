# frozen_string_literal: true
require 'rails_helper'

describe "Courses & it's tutors API", type: :request do
  describe "POST /courses endpoint" do
    it 'create new course & it\'s tutors' do
      @course_req = build(:course_req, :course)
      @tutor_req = [ build(:tutor_req, :tutor1), build(:tutor_req, :tutor2) ]

      post "/courses", params: {"course": {
        course_name: @course_req[:course_name],
        skill: @course_req[:skill],
        fee: @course_req[:fee],
        tutor_details: @tutor_req
      } }

      json_response = JSON.parse(response.body)
      expect(json_response["success"]).to match(true)
      expect(json_response["msg"]).to match("Course created successful")
    end
  end

  describe "GET /courses endpoint" do
    it 'index course & it\'s tutors' do

      get "/courses"

      json_response = JSON.parse(response.body)
      expect(json_response["success"]).to match(true)
      # expect(response.status).to match(200)
    end
  end
end
