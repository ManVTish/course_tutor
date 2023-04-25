class CoursesController < ApplicationController
  def create
    new_course = Course.new(
      course_name: course_params[:course_name],
      skill: course_params[:skill],
      fee: course_params[:fee]
    )
    if new_course.save
      tutor_params = course_params[:tutor_details]
      new_tutor = []
      tutor_params.each do |t|
        new_tutor << Tutor.create(
          tutor_name: t[:tutor_name],
          expertise: t[:expertise],
          degree: t[:degree],
          yoe: t[:yoe],
          course_id: new_course.id
        )
      end
      res = {
        course: new_course,
        tutor: new_tutor
      }
      render json: {res: res, msg: "Course created successful"}
    else
      render json: {msg: "#{new_course.errors.full_messages}"}
    end
  end

  private

  def course_params
    params.require(:course)
          .permit(:course_name, :skill, :fee,
                  tutor_details: [:tutor_name, :expertise, :degree, :yoe])
  end
end
