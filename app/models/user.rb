class User < ApplicationRecord
  has_one_attached :profile_image
  has_many :notes ,dependent: :destroy
  has_many :texts ,dependent: :destroy

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/default-image.jpg")
      profile_image.attach(io: File.open(file_path),filename: "default-image.jpg")
    end
    profile_image.variant(resize_to_limit: [width,height]).processed
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
