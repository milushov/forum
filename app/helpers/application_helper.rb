module ApplicationHelper
  def auth_page?
    params[:controller] =~ /devise/
  end
end
