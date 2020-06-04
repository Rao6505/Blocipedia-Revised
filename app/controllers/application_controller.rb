class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  protect_from_forgery with: :exception

rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

private

  def user_not_authorized
    flash[:warning] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def upgrade_current_user
    current_user.update_attributes(:role => "premium")
  end

  def downgrade_current_user
    current_user.update_attributes(:role => "standard")
    current_user.wikis.update_all(:private => "false")
  end

end
