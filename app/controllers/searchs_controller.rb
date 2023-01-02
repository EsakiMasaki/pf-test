class SearchsController < ApplicationController
  def search
    @word = params[:word]
    if params[:user_search]
      @users = User.looks(@word)
      render "/searchs/user_search_index"
    elsif params[:note_search]
      @notes = Note.looks(@word)
      render "/searchs/note_search_index"
    end
  end
end
