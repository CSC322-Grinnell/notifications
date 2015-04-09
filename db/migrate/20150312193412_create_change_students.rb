class CreateChangeStudents < ActiveRecord::Migration
	def change_table
		add_column :students, :can_text, :boolean, :default => true
	end
end
