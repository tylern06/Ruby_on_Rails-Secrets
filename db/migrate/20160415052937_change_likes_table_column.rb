class ChangeLikesTableColumn < ActiveRecord::Migration
  def change
  	rename_column :likes, :likes, :count
  end
end
