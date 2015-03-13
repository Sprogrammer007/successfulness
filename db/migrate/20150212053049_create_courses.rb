class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :user
      t.references :course_category
      t.text :collaborators, array: true, default: []
      t.string :title
      t.text :description
      t.string :course_type
      t.decimal :price
      t.string :payment_method
      t.integer :max_student, default: 0
      t.integer :discount
      t.attachment :thumbnail
      t.text :prerequisites, array: true, default: []
      t.datetime :start_date, default: Date.today.beginning_of_day
      t.datetime :end_date, default: Date.today.end_of_day
      t.string :status, default: 'draft'
      t.timestamps
    end

    add_index :courses, :title, unique: true
    add_index :courses, :course_type
  end
end
