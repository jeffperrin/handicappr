class HomeController < ApplicationController
  def show
    if signed_in?
      redirect_to golfer_path :user => current_user.username
    end
  end
end