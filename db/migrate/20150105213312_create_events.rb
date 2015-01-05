class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :type
      t.string :teachers
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
