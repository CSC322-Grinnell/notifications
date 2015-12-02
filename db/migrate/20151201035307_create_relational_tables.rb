class CreateRelationalTables < ActiveRecord::Migration
  def up
    create_table :classrooms_users, id: false do |t|
      t.belongs_to :users, index: true
      t.belongs_to :classrooms, index: true
    end
    create_table :classrooms_students, id: false do |t|
      t.belongs_to :classrooms, index: true
      t.belongs_to :students, index: true
    end
  end

  def down
    drop_table :classrooms_users
    drop_table :classrooms_students
  end
end
