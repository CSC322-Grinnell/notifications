class ChangeUsers < ActiveRecord::Migration
  def up
    add_column :users, :phone_number, :string
  end

  def down
    remove_column :users, :phone_number
  end
end
