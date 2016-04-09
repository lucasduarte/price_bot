class ChangePriceFieldInProducts < ActiveRecord::Migration
  def change
		change_column :products, :last_price, :decimal, :precision => 10, :scale => 2
		change_column :alerts, :last_price, :decimal, :precision => 10, :scale => 2
		change_column :alerts, :old_price, :decimal, :precision => 10, :scale => 2
  end
end
