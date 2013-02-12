class Patron < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  belongs_to :transaction

  def self.search(search)
    if(search)
      bind = "%#{search}%"
      where("first_name LIKE ? OR last_name LIKE ?",bind,bind)
    else
      nil
    end
  end
end
