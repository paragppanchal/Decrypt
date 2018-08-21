class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :content
      t.string :written_by

      t.timestamps
    end
  end
end
