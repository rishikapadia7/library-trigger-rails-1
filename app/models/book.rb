class Book < ActiveRecord::Base
  attr_accessible :author, :checked_out, :title

  validates :author, :presence => true
  validates :title, :presence => true

  belongs_to :transaction

  def self.where_checked_out_is state
    self.where(:checked_out => state)
  end
end
