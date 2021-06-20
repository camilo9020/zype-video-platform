class HomeController < ApplicationController

  def index
    client = ZypeClient.new

    @accessToken = params[:accessToken]
    @expirationDate = params[:expirationDate]
    @videos = client.get_videos["response"]
  end
end
