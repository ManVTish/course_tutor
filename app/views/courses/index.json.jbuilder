# frozen_string_literal: true

json.array! @courses do |course|
  json.id course.id
  json.name course.course_name
  json.skill course.skill
  json.fees_in_USD course.fee
  json.created_at course.created_at
  json.course_tutors course.tutors do |tutor|
    json.id tutor.id
    json.name tutor.tutor_name
    json.expertise tutor.expertise
    json.qualification tutor.degree
    json.work_exp_in_years tutor.yoe
  end
end
