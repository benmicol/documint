class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string "summary"
      t.text "content"
      t.string "image"
      t.integer "document_id"
      t.timestamps null: false
    end
  end
end
