class Text < ApplicationRecord
  belongs_to :note
  has_one_attached :text_image

  def get_text_image(width,height)
    unless text_image.attached?
      file_path = Rails.root.join("app/assets/images/default-image.jpg")
      text_image.attach(io: File.open(file_path),filename: "default-image.jpg")
    end
    text_image.variant(resize_to_limit: [width,height]).processed
  end
end
