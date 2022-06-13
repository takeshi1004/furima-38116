class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text   :content,   null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :ship_charge_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :take_days_id, null: false
      t.integer :total_price, null: false
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
