class AddContactsTemplatesTranslations < ActiveRecord::Migration
  def change
     create_table :contacts do |t|
      t.integer :student_id
      t.string :Name
      t.string :Phone_Number
      t.string :Email
      t.string :relationship
      t.string :language, :default=> "english"
      t.boolean :can_text, :default=> true
      t.timestamps
    end
    
    create_table :templates do |t|
      t.string :template_name
    end
    
    create_table :translations do |t|
      t.integer :template_id
      t.string :language
      t.string :message
    end
  end
end
