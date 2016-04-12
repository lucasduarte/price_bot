class AddFailCountToProducts < ActiveRecord::Migration
  def change
		add_column :products, :fail_count, :integer, default: 0
		add_column :products, :status, :boolean, default: true
  end
end
