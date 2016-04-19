class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :secret, index: true
      t.references :user, index: true
      t.integer :likes
      t.timestamps
    end
  end
end
