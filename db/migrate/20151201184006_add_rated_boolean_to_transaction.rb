class AddRatedBooleanToTransaction < ActiveRecord::Migration
  def change
  	add_column :transactions, :rated, :boolean, default: false
  end
end
