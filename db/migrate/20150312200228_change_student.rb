class ChangeStudent < ActiveRecord::Migration
	def change
		add_column :students, :can_text, :boolean, :default => true
	end
end
