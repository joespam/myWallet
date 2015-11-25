class UsersSharedCards < ActiveRecord::Migration
  def change
		create_table :user_shared_cards, :id => false do |t|
			t.integer :user_id
			t.integer :card_id
		end
  end
end
