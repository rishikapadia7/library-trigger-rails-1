class BooleanDefaultValueChanger < ActiveRecord::Migration
  def up
    change_column(:books, :checked_out, :boolean, :default => false )
  end

  def down
  end
end
