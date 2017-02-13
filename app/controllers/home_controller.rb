class HomeController < ApplicationController
  def index
    @links = RecentLinks.list
  end
end
