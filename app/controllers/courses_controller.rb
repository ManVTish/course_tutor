class CoursesController < ApplicationController
  def index
    @course_tutor = Tutor.all.includes(:course)
  end

  def create
    new_course = Course.new(
      course_params
    )
    if new_course.save
      build_tutor_details(new_course.id)
      render json: {msg: "Course created successful"}
    else
      render json: {msg: "#{new_course.errors.full_messages}"}
    end
  end

  private

  def course_tutor_params
    params.require(:course)
          .permit(:course_name, :skill, :fee,
                  tutor_details: [:tutor_name, :expertise, :degree, :yoe])
  end

  def course_params
    {
      course_name: course_tutor_params[:course_name],
      skill: course_tutor_params[:skill],
      fee: course_tutor_params[:fee]
    }
  end

  def build_tutor_details(course_id)
    tutor_params = course_tutor_params[:tutor_details]
    tutor_params.each do |t|
      Tutor.create(
        tutor_name: t[:tutor_name],
        expertise: t[:expertise],
        degree: t[:degree],
        yoe: t[:yoe],
        course_id: course_id
      )
    end
  end
end
