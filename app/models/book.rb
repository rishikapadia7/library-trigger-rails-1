class Book < ActiveRecord::Base
  attr_accessible :author, :checked_out, :title

  validates :author, :presence => true
  validates :title, :presence => true

  belongs_to :transaction

  def self.search(search)
    if(search)
      bind = "%#{search}%"
      where("title LIKE ? OR author LIKE ?",bind,bind)
    else
      nil
    end
  end
end
