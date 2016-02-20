class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :name
      t.string :link
      t.string :logo
      t.string :regular_price_tag
      t.string :discounted_price_tag
      t.string :product_description_tag
      t.string :product_image_tag
      t.boolean :status

      t.timestamps null: false
    end
  end
end
