class SessionController < ApplicationController
  include SessionHelper

  def sign_in; end

  def create
    response = client.get_access_token(params[:email], params[:password])

    accessToken = response["access_token"]
    expirationDate = calculate_expiration_date(response["expires_in"]);

    binding.pry

    redirect_to root_path({ accessToken: accessToken, expirationDate: expirationDate } )
  end

  private

  def client
    ZypeClient.new
  end
end
