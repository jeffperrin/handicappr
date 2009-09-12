class SessionsController < Clearance::SessionsController
  def url_after_create
    golfer_path :user => @user.name
  end
end