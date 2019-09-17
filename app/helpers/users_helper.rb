module UsersHelper
  def logged_in?


    # current_user.present?
    !current_user.nil?
  end
end
