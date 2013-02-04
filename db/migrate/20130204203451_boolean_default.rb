class BooleanDefault < ActiveRecord::Migration
  def up
    change_column(:books, :checked_out, :boolean, :default => false )
  end
end
