class AddIndices < ActiveRecord::Migration
  def up
    add_index(:patrons , :id)
    add_index(:books , :id)
    add_index(:transactions , :book_id)
    add_index(:transactions , :patron_id)
  end

  def down
    remove_index(:patrons , :column => :id)
    remove_index(:books , :column => :id)
    remove_index(:transactions , :column => :book_id)
    remove_index(:transactions , :column => :patron_id)
  end
end
