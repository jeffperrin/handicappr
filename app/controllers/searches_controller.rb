class SearchesController < ApplicationController

  def index
    @results = []
    if params[:val]
      @results = User.username_like(params[:val]).ascend_by_username
    end
  end
  
end
