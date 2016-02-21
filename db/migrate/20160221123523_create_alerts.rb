class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :description, limit: 500
      t.string :link, limit: 500
      t.string :image, limit: 500
			t.decimal :last_price, precision: 2
			t.decimal :old_price, precision: 2
      t.boolean :mail_sent
      t.boolean :visited

      t.timestamps null: false
    end
  end
end
