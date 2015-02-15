class CreatePageTemplates < ActiveRecord::Migration
  def change
    create_table :page_templates do |t|
      t.string :name
      t.string :descriptions
      t.string :category
      t.attachment :thumbnail
    end

    add_index :page_templates, :category
  end
end
