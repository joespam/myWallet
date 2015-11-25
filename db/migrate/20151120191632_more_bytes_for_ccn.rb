class MoreBytesForCcn < ActiveRecord::Migration
  def change
  	change_column :cards, :number, :integer, :limit => 8
  end
end
