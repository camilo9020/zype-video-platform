class HomeController < ApplicationController

  before_action :get_session

  def index
    @videos = client.get_videos["response"]
  end

  def show
    @video = { id: params["video"]["_id"], title: params["video"]["title"], subscription_required:  params["video"]["subscription_required"] == "true" }
    if @video[:subscription_required] && params["accessToken"] == "accessTokenToReplace"
      redirect_to session_sign_in_path(@video)
    end
  end

  private

  def client
    ZypeClient.new
  end

  def get_session
    @session = Session.find(params[:session_id]) if params[:session_id]

  end
end
