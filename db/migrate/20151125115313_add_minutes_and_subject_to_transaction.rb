class AddMinutesAndSubjectToTransaction < ActiveRecord::Migration
  def change
  	add_column :transactions, :minutes, :integer, :default => 60
  	add_column :transactions, :subject, :string
  end
end
