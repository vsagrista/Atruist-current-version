class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|
      t.string :name
      t.text :description
      t.integer :rating, default: 0
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
