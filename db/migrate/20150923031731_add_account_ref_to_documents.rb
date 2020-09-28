class AddAccountRefToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :account, index: true, foreign_key: true
  end
end
