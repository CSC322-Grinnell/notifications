class CreateRelationalTables < ActiveRecord::Migration
  def up
    create_table :users_classrooms do |t|
      t.belongs_to :users, index: true
      t.belongs_to :classrooms, index: true
    end
    create_table :classrooms_students do |t|
      t.belongs_to :classrooms, index: true
      t.belongs_to :students, index: true
    end
  end

  def down
    drop_table :users_classrooms
    drop_table :classrooms_students
  end
end
