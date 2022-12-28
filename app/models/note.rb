class Note < ApplicationRecord
  has_many_attached :note_image
  belongs_to :user
  has_many :texts

  accepts_nested_attributes_for :texts, allow_destroy: true

  def get_note_image(width,height)
    unless note_image.attached?
      file_path = Rails.root.join("app/assets/images/default-image.jpg")
      note_image.attach(io: File.open(file_path))
    end
    note_image.variant(rename_to_limit: [width,height]).processed
  end
end
