class UpdateContactName < ActiveRecord::Migration
  def up
    rename_column :contacts, :Name, :name
  end

  def down
    rename_column :contacts, :name, :Name
  end
end
