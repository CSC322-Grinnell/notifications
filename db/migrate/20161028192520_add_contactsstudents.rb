class AddContactsstudents < ActiveRecord::Migration
  def change
    create_table :contacts_students do |t|
      t.integer :student_id
      t.integer :contact_id
      t.timestamps
    end
  end
end
