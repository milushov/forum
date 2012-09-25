class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :text
      t.string :reply_to

      t.timestamps
    end
  end
end
