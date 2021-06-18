class HomeController < ApplicationController
  def index
    @videos = Video.all.order(created_at: :desc)
  end
end
