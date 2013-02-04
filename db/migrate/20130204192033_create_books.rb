class CreateBooks < ActiveRecord::Migration
  def up
    create_table :books do |t|
      t.string :title
      t.string :author
      t.boolean :checked_out

      t.timestamps
    end
  end

  def down
    drop_table :books
  end
end
