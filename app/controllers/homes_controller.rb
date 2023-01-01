class HomesController < ApplicationController
  def top
    @notes = Note.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    @notes.each do |note|
      unless Category.exists?(id: note.category_id)
        note.category_id = nil
      end
    end
  end

  def about
  end
end
