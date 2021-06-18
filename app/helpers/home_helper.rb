module HomeHelper
    def get_video_link(video)
        if video["purchase_required"]
            user_signed_in? ? 'https://www.youtube.com/embed/' + video["youtube_id"] : new_user_session_path
        else
            'https://www.youtube.com/embed/' + video["youtube_id"]
        end
    end

    def allow_reproduce(video)
        if video["purchase_required"]
            user_signed_in? ? true : false
        else
            true
        end
    end
end
