class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :number
      t.string :type
      t.integer :expire_month
      t.integer :expire_year
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
