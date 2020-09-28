class AddRequirementsToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :requirements, :string
  end
end
