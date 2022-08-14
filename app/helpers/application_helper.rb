module ApplicationHelper
  def gravartar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    # compile URL which can be used in <img src="RIGHT_HERE"...
    gravartar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravartar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end
end
