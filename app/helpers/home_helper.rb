module HomeHelper
    def get_video_link(video)
        if video.video_type == 'premium'
            user_signed_in? ? video.link : new_user_session_path
        else
            video.link
        end
    end

    def allow_reproduce(video)
        if video.video_type == 'premium'
            user_signed_in? ? true : false
        else
            true
        end
    end
end
