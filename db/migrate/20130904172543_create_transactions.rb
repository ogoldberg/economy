class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :giver
      t.references :recipient
      t.text :points

      t.timestamps
    end
  end
end
