class CreateBets < ActiveRecord::Migration[5.0]
  def change
    create_table :bets do |t|
      t.decimal :amount, precision: 9, scale: 2
      t.integer :user_1
      t.integer :user_2
      t.integer :judge
      t.string :terms

      t.timestamps
    end
  end
end
