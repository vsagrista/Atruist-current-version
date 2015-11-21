class AddCityToTalents < ActiveRecord::Migration
  def change
  	add_column :talents, :city, :string
  end
end
