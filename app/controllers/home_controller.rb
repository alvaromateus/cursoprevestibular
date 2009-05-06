class HomeController < ApplicationController
  def index
    render :partial => "home"
  end
end
