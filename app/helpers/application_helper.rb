module ApplicationHelper

  def profile_picture(type=large)
    puts @user.image_url.split("=")[0] << "=#{type}"
  end


end
