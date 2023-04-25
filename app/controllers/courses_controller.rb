class CoursesController < ApplicationController
  def create
    new_course = Course.new(
      course_params
    )
    if new_course.save
      render json: {res: new_course, msg: "Course created successful"}
    else
      render json: {msg: "#{new_course.errors.full_messages}"}
    end
  end

  private

  def course_params
    params.require(:courses)
          .permit(:course_name, :skill, :fee,
                  tutorial_details: [])
  end
end
