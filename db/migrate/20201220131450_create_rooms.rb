class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :user, foreign_key: true
      t.references :participate, foreign_key: { to_table: :users }

      t.timestamps
      
      t.index [:user_id, :participate_id], unique: true
    end
  end
end
