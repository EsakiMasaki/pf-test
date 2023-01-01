class NotesController < ApplicationController
  def new
    @note = Note.new
    @texts = @note.texts.build
  end

  def create
    @note = current_user.notes.new(note_params)
    if @note.save!
      redirect_to note_path(@note)
    else
      render :new
    end
  end

  def index
    @notes = current_user.notes.all.order(created_at: :desc)
  end

  def show
    @note = Note.find(params[:id])
    unless Category.exists?(id: @note.category_id)
      @note.update(category_id: nil)
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to note_path(@note)
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.destroy
      redirect_to notes_path
    else
      render :show
    end
  end

  private

  def note_params
    params.require(:note).permit(:title,:can,:necessities,:conclude,:category_id,:publish_status,texts_attributes: [:id,:procedure,:text,:text_image,:_destroy])
  end
end
