class ChangeCountColumn < ActiveRecord::Migration
  def change
  	rename_column(:likes, :count, :tally)
  end
end
