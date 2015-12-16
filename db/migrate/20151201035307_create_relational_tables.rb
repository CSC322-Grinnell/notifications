class CreateRelationalTables < ActiveRecord::Migration
  def up
    create_table :classrooms_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :classroom, index: true
    end
    create_table :classrooms_students, id: false do |t|
      t.belongs_to :classroom, index: true
      t.belongs_to :student, index: true
    end
  end

  def down
    drop_table :classrooms_users
    drop_table :classrooms_students
  end
end
