module SessionHelper
    def calculate_expiration_date(expires_in)
        DateTime.now + expires_in.seconds
    end
end
