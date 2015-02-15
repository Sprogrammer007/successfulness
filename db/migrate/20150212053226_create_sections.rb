class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.string :note
      t.string :section_type
      t.references :course
      t.references :user
      t.references :page_template
      t.timestamps
    end

    add_index :sections, :section_type, unique: false
  end
end
