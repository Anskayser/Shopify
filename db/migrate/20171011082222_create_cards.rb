class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.integer :user_id
      t.integer :card_no
      t.string :expiration_date
      t.string :expiration_month
      t.string :Token

      t.timestamps
    end
  end
end
