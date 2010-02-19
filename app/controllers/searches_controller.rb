class SearchesController < ApplicationController

  def index
    @results = []
    if params[:val]
      @results = User.search(params[:val])
    end
  end
  
end
