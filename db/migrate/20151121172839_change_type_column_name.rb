class ChangeTypeColumnName < ActiveRecord::Migration
  def change
  	rename_column :cards, :type, :cardtype
  end
end
