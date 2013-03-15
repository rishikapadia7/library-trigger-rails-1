class Transaction < ActiveRecord::Base
  attr_accessible :book_id, :checkin_date, :checkout_date, :patron_id
  attr_reader :created_at

  has_one :patron
  has_one :book
  
  validates_presence_of :book_id, :patron_id, :checkout_date
end
