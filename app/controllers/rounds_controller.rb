class RoundsController < ApplicationController
  
  def create
    @round = Round.new(params[:round])
    @round.user = current_user
    respond_to do |format|
      if @round.save
        flash[:notice] = 'Round was added.'
        format.html { redirect_to golfer_path :user => current_user.name }
      else
        flash[:error] = 'Couldn\'t create the round'
        format.html do
          @user = current_user
          render :template => 'users/show'
        end
      end
    end
  end

end