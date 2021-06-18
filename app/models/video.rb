class Video < ApplicationRecord
    extend Enumerize

    enumerize :video_type, in: [:free, :premium]
end
