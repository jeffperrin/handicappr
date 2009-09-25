class UsersController < Clearance::UsersController
  def show
    @user = User.find_by_name(params[:user])
    if @user.nil?
      render :not_found
    elsif @user != current_user
      render :show_other_user
    else
      @round = Round.new
      @round.user = @user
      render :show_current_user
    end
  end
end