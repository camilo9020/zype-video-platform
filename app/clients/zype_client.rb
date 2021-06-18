class ZypeClient
    include HTTParty

    def get_videos
        url = 'https://api.zype.com/videos?app_key=' + ENV['APP_KEY']
        response = begin
          HTTParty.get(url)
        rescue Timeout::Error
          nil
        end
        response.nil? ? response : JSON.parse(response.body)
    end
end