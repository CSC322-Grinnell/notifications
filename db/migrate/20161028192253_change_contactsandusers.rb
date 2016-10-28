class ChangeContactsandusers < ActiveRecord::Migration
  def up
    #add_column :users, :phone_number, :string
    remove_column :contacts, :student_id
  end

  def down
    #remove_column :users, :phone_number, :string
    add_column :contacts, :student_id, :integer
  end
end
