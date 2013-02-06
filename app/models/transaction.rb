class Transaction < ActiveRecord::Base
  attr_accessible :book_id, :checkin_date, :checkout_date, :patron_id

  has_one :patron
  has_one :book

  validates :book_id, :presence => true
  validates :patron_id, :presence => true
end
