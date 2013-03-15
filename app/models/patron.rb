class Patron < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  has_one :transaction

  def self.search(search)
    if(search)
      bind = "%#{search.downcase}%"
      where("lower(first_name) LIKE ? OR lower(last_name) LIKE ?",bind,bind)
    else
      nil
    end
  end
end
