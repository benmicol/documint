class AddPersonsToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :persons, :string
  end
end
