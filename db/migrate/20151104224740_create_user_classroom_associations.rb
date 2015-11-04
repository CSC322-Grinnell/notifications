class CreateUserClassroomAssociations < ActiveRecord::Migration
  def change
    create_table :user_classroom_associations do |t|
      t.integer :user_id
      t.integer :classroom_id

      t.timestamps
    end
  end
end
