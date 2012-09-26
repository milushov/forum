class AddReferenceForTopic < ActiveRecord::Migration
  def up
    change_table :topics do |t|
      t.references :board
    end
  end

  def down
    remove_column :topics, :board_id
  end
end
