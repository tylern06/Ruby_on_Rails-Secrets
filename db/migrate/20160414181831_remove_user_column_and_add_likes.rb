class RemoveUserColumnAndAddLikes < ActiveRecord::Migration
  def change
  	remove_reference :secrets, :user, index: true
  	add_column :secrets, :likes, :integer
  end
end
