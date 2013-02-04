class Book < ActiveRecord::Base
  attr_accessible :author, :checked_out, :title
end
