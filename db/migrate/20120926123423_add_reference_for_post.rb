class AddReferenceForPost < ActiveRecord::Migration
  def up
    change_table :posts do |t|
      t.references :topic
    end
  end

  def down
    remove_column :posts, :topic_id
  end
end
