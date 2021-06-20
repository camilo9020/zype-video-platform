module SessionHelper
    def calculate_expiration_date(expires_in)
        Time.now + expires_in.seconds
    end
end
