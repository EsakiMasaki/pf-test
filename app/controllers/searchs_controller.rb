class SearchsController < ApplicationController
  def search
    @word = params[:word]
    if params[:user_search]
      @users = User.looks(@word)
      render "/searchs/user_search_index"
    end
  end
end
