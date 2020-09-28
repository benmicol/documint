class AddAccountRefToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :account, index: true, foreign_key: true
  end
end
