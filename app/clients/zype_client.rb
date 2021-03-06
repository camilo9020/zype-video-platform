class ZypeClient
    include HTTParty

    def initialize
      @base_url = 'https://api.zype.com/videos'
      @base_oauth_url = 'https://login.zype.com/oauth/'
    end

    def get_access_token(email, password)
      response = HTTParty.post(@base_oauth_url + 'token', body: build_body(email, password, 'password'), headers: headers)
      JSON.parse(response.body)
    end

    def refresh_access_token(email)
      response = HTTParty.post(@base_oauth_url + 'token', body: build_body(email, 'refresh_token'), headers: headers)
      JSON.parse(response.body)
    end

    def get_access_token_status(access_token)
      response = HTTParty.get(@base_oauth_url + 'info', headers: headers)
      JSON.parse(response.body)
    end

    def revoke_access_token(email)
      response = HTTParty.post(@base_oauth_url + 'revoke', headers: headers)
      JSON.parse(response.body)
    end

    def get_videos
        response = begin
          HTTParty.get(@base_url + "?app_key=" + ENV['APP_KEY'])
        rescue Timeout::Error
          nil
        end
        response.nil? ? response : JSON.parse(response.body)
    end

    def check_video_entitlement(videoId)
      pathComplement = "/#{videoId}/entitled?api_key=#{ENV['APP_KEY']}"
      response = begin
      HTTParty.get(@base_url + pathComplement)
      rescue Timeout::Error
        nil
      end
      response.nil? ? response : JSON.parse(response.body)
    end

    private

    def headers
      { "Content-Type" => "application/json",
      "Accept" => "application/json" }
    end

    def build_body(email, password, grantTypeKey)
      {
        "client_id": ENV["OAUTH_CLIENT_ID"],
        "client_secret": ENV["OAUTH_CLIENT_SECRET"],
        "user_name": email,
        "password": password,
        "grant_type": grantTypeKey
      }.to_json
    end
end