class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[5.1]
  def change
  change_column :cards, :card_no, :integer, limit: 8
  rename_column :cards, :expiration_date, :expiration_year
  end
end
