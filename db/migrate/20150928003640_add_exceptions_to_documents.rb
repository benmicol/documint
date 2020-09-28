class AddExceptionsToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :exceptions, :text
  end
end
