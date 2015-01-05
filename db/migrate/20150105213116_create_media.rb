class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :url
      t.string :type
      t.string :teachers
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
