class HomeController < ApplicationController
  def index
    @hotreads = Read.hotreads
  end
end
