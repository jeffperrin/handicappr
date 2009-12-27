class RoundsController < ApplicationController
  
  def index
    fetch_user_by_name
    @rounds = Round.paginate_by_user_id @user.id, :page => params[:page], :order => 'updated_at DESC', :per_page => 10
  end
  
  def edit
    @round = Round.find(params[:id])
  end
  
  def update
    @round = Round.find(params[:id])
    respond_to do |f|
      if @round.update_attributes(params[:round])
        flash[:notice] = 'Round has been updated'
        f.html {redirect_to history_path :user => current_user.username}
      else
        flash[:error] = 'Couldn\'t edit the round'
        f.html {render :template => 'rounds/edit'}
      end
    end
  end
  
  def create
    @round = Round.new(params[:round])
    @round.user = current_user
    respond_to do |format|
      if @round.save
        flash[:notice] = 'Round was added.'
        format.html { redirect_to golfer_path :user => current_user.username }
      else
        flash[:error] = 'Couldn\'t create the round'
        format.html do
          @user = current_user
          render :template => 'users/show_current_user'
        end
      end
    end
  end

end