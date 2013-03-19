class Transaction < ActiveRecord::Base
  attr_accessible :book_id, :checkin_date, :checkout_date, :patron_id
  attr_reader :created_at

  belongs_to :patron
  belongs_to :book

  validates_presence_of :book_id, :patron_id, :checkout_date

  def as_json(options = nil )
    { :id => id,
      :patron_id => patron_id,
      :book_id => book_id,
      :first_name => Patron.find(patron_id).first_name,
      :last_name => Patron.find(patron_id).last_name,
      :title => Book.find(book_id).title,
      :author => Book.find(book_id).author,
      :checkout_date => checkout_date,
      :checkin_date => checkin_date
    }
  end  

  
end
