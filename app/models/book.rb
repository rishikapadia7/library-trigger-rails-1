class Book < ActiveRecord::Base
  attr_accessible :author, :checked_out, :title

  validates :author, :presence => true
  validates :title, :presence => true

  belongs_to :transaction

  def self.search(search)
    if(search)
      bind = "%#{search}%"
      where("(title LIKE ? OR author LIKE ?) AND checked_out = ?",bind,bind,false)
    else
      nil
    end
  end
end
