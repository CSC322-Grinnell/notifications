class AddCanTextToStudent < ActiveRecord::Migration
	def change
		add_column :students, :Can_Text, :boolean, :default => true
	end
end
