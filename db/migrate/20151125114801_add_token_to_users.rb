class AddTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :tokens, :string, array: true, default: [] 
  end
end
