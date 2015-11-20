class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :talents, index: true
      t.references :sender
      t.references :recipient
      t.boolean :accepted, default: false
      t.boolean :cancelled, default: false
      t.integer :cancelation_count, default: 0
      t.integer :review, default: 0
      t.string :review_comment
      t.string :token
      t.timestamps null: false
    end
  end
end
