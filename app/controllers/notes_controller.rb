class NotesController < ApplicationController
  def new
    @note = Note.new
    @texts = @note.texts.build
  end

  def create
    @note = Note.new(note_params)
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:note_image,texts_attributes: [:procedure,:_destroy])
  end
end
