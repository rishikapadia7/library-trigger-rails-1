class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :patron_id
      t.integer :book_id
      t.timestamp :checkout_date
      t.timestamp :checkin_date

      t.timestamps
    end
  end
end
