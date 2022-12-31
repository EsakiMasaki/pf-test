class Note < ApplicationRecord
  belongs_to :user
  has_many :texts, dependent: :destroy
  has_many :favorites , dependent: :destroy
  has_many :favorited_users , through: :favorites , source: :user

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  validates :title ,presence: true
  validates :can ,presence: true
  validates :conclude ,presence: true

  accepts_nested_attributes_for :texts, allow_destroy: true

end
