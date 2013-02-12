module PatronsHelper
  def full_name_of patron
    patron.first_name + ' ' + patron.last_name
  end
end
