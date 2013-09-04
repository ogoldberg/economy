class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.belongs_to :giver, :null => false
      t.belongs_to :recipient, :null => false
      t.belongs_to :point, :null => false
      t.timestamps
    end
  end
end
