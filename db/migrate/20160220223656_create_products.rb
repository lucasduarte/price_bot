class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description, limit: 500
      t.string :link, limit: 500
      t.string :image, limit:500
			t.decimal :last_price, precision: 2
      t.integer :alert_range
      t.integer :website_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
