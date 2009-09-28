class UsersController < Clearance::UsersController
  
  before_filter :fetch_user_by_name, :only => [:show, :edit]
  before_filter :fetch_user_by_id, :only => [:update, :delete]
  before_filter :authorize_as_owner, :only => [:edit, :update, :delete] 
  
  def show
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
  
  def edit
    
  end
  
  def update
    respond_to do |f|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Your profile was updated'
        f.html{ redirect_to golfer_path :user => current_user.username }
      else
        flash[:error] = 'There were errors in your profile'
        f.html{ render_template 'users/update' }
      end
    end
  end
  
  private
  def fetch_user_by_name
    @user = User.find_by_username(params[:user])
  end
  
  def fetch_user_by_id
    @user = User.find params[:id]
  end
end