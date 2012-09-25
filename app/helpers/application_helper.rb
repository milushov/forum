module ApplicationHelper
  def auth_page?
    params[:controller] =~ /devise/
  end

  def avatar user
    user.avatar || 'http://vk.com/images/camera_a.gif'
  end
end
