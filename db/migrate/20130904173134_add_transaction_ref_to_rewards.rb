class AddTransactionRefToRewards < ActiveRecord::Migration
  def change
    add_reference :rewards, :transaction, index: true
  end
end
