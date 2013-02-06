class Book < ActiveRecord::Base
  attr_accessible :author, :checked_out, :title

  validates :author, :presence => true
  validates :title, :presence => true

  belongs_to :transaction
end
