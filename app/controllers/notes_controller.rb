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
    @notes = current_user.notes.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to note_path(@note)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:title,:can,:necessities,:conclude,texts_attributes: [:id,:procedure,:text,:text_image,:_destroy])
  end
end
