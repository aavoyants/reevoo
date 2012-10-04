class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.decimal :price, :precision => 7, :scale => 2
      t.integer :rule_id
      t.timestamps
    end
  end
end
