module UsersHelper
    # Returns the Gravatar for the given user.
    def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://gravatar.com/avatar/80c9f0aeae265ebb958e36124b3d02d6?s=400&d=robohash&r=x#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
end