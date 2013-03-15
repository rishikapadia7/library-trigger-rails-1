class Book < ActiveRecord::Base
  attr_accessible :author, :checked_out, :title

  validates :author, :presence => true
  validates :title, :presence => true

  has_one :transaction

  def self.search(search)
    if(search)
      bind = "%#{search.downcase}%"
      where("(lower(title) LIKE ? OR lower(author) LIKE ?) AND checked_out = ?",bind,bind,false)
    else
      nil
    end
  end
end
