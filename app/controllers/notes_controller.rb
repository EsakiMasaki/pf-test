class NotesController < ApplicationController
  def new
    @note = Note.new
    @texts = @note.texts.build
  end

  def create
    @note = current_user.notes.new(note_params)
    if @note.save
      redirect_to note_path(@note)
    else
      render :new
    end
  end

  def index
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:note_image,:title,:can,texts_attributes: [:procedure,:text,:_destroy])
  end
end
