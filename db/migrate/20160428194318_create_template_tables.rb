class CreateTemplateTables < ActiveRecord::Migration
  def up
    create_table :templates do |t|
      t.string :name
    end
    create_table :translations do |t|
      t.belongs_to :template, index: true
      t.string :locale, index: true
      t.string :translation
    end

    add_column :users, :locale, :string
    add_column :students, :locale, :string
  end

  def down
  end
end
