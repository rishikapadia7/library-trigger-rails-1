class WelcomeController < ApplicationController
  before_filter :check_logged_in
  def home
  end
end
