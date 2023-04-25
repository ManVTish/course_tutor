class CreateTutors < ActiveRecord::Migration[7.0]
  def change
    create_table :tutors do |t|
      t.string :tutor_name
      t.string :expertise
      t.string :degree
      t.integer :yoe
      t.references :course, null: false

      t.timestamps
    end

    add_foreign_key :tutors, :courses, column: :course_id
  end
end
