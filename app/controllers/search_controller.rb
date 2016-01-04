class SearchController < ApplicationController

  def index
    if params[:search].present?
      @users = User.search(params[:search])
    end
  end
end
