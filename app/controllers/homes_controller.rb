class HomesController < ApplicationController
  def top
    @notes = Note.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
  end

  def about
  end
end
