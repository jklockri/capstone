class CreateWins < ActiveRecord::Migration[5.0]
  def change
    create_table :wins do |t|
      t.boolean :win
      t.integer :user_id
      t.integer :bet_id

      t.timestamps
    end
  end
end
