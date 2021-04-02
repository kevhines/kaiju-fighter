module UsersHelper

    def display_username(user)
        user.username.split("@").first
    end

end
