class ChangeTypeOfColumnTextPostsTable < ActiveRecord::Migration
  def up
    change_table :posts do |t|
      t.change :text, :text
    end
  end

  def down
    change_table :posts do |t|
      t.change :text, :string
    end
  end
end
