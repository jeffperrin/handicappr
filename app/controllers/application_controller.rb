# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Clearance::Authentication

  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'ef0abd1ccfc828817c1d3b6905deb19b'
  
  filter_parameter_logging :password
  
  def authorize_as_owner
    if current_user == nil 
      flash[:error] = "Mind your own business"
      redirect_to error_url, :status => 401
    end
    unless @user.id == current_user.id 
      #You don’t belong here. Go away. 
      flash[:error] = "Mind your own business"
      redirect_to error_url, :status => 401 
    end
  end
  
  protected
  def fetch_user_by_name
    @user = User.find_by_username(params[:user])
  end
  
  def fetch_user_by_id
    @user = User.find params[:id]
  end
  
end
