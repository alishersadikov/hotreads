class HomeController < ApplicationController
  def index
    @hotreads = Read.all
  end
end
