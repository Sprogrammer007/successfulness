class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.integer :delay
      t.string :note
      t.string :order
      t.references :course
      t.text :medias
      t.timestamps
    end
  end
end
