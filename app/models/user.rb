class User < ApplicationRecord
  has_one_attached :profile_image
  has_many :notes ,dependent: :destroy
  has_many :texts ,dependent: :destroy
  has_many :note_comments ,dependent: :destroy
  has_many :categories ,dependent: :destroy
  has_many :favorites , dependent: :destroy
  has_many :favorited_users , through: :favorites , source: :note

  has_many :relationships , class_name: "Relationship" , foreign_key: "follower_id" , dependent: :destroy
  has_many :reverse_of_relationships , class_name: "Relationship" , foreign_key: "followed_id" , dependent: :destroy
  has_many :followings , through: :relationships , source: :followed
  has_many :followers , through: :reverse_of_relationships , source: :follower

  def followings?(user)
    followings.include?(user)
  end

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
