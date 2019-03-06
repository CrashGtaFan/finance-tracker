class CreateUserStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_stocks do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :stock, foreign_key: true

      t.timestamps
    end
  end
end
