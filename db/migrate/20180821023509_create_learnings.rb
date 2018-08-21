class CreateLearnings < ActiveRecord::Migration[5.2]
  def change
    create_table :learnings do |t|
      t.string :title
      t.string :content
      t.string :video_url

      t.timestamps
    end
  end
end
