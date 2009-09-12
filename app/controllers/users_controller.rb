class UsersController < Clearance::UsersController
  def show
    @user = User.find_by_name(params[:user])
    @round = Round.new
    @round.user = @user
  end
end