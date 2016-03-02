class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.belongs_to :message, index: true
      t.belongs_to :student, index: true
      t.timestamps
    end
  end
end
