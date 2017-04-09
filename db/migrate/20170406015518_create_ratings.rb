class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :player_rating
      t.integer :judge_rating
      t.integer :bet_id

      t.timestamps
    end
  end
end
