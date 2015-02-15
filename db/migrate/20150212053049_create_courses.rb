class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :user
      t.references :course_category
      t.string :collaborators
      t.string :title
      t.text :description
      t.text :note
      t.string :course_type
      t.decimal :price
      t.string :charge_method
      t.boolean :student_limit
      t.integer :max_student
      t.integer :discount
      t.attachment :thumbnail
      t.string :prerequisites
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end

    add_index :courses, :title, unique: true
    add_index :courses, :course_type
  end
end
