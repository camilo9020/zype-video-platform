class HomeController < ApplicationController

  def index
    client = ZypeClient.new
    @videos = client.get_videos["response"]
  end
end
