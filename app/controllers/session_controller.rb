class SessionController < ApplicationController
  include SessionHelper

  def sign_in; end

  def create
    response = client.get_access_token(params[:email], params[:password])

    if response["access_token"]
      expirationDate = calculate_expiration_date(response["expires_in"]);
      @session = Session.create({ email: params[:email], accessToken: response["access_token"], expiresIn: expirationDate, refreshToken: response["refresh_token"]})
    end
    if params["id"] && params["subscription_required"]
      redirect_to home_show_path({ video: { _id: params["id"], title: params["title"], subscription_required: params["subscription_required"] }, session_id: @session.id })
      return
    end
    redirect_to root_path({ session_id: @session.id } )
  end

  private

  def client
    ZypeClient.new
  end
end
