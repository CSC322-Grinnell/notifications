class AddClassroomToUsers < ActiveRecord::Migration
  def change
    add_column :users, :classroom, :string
  end
end
