class UpdateReceipts < ActiveRecord::Migration
  def up
    remove_column :receipts, :student_id
    add_column :receipts, :contact_id, :integer
  end

  def down
    add_column :receipts, :student_id, :integer
    remove_column :receipts, :contact_id 
  end
end
