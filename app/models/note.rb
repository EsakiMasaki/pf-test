class Note < ApplicationRecord
  belongs_to :user
  belongs_to :category ,optional: true
  has_many :texts, dependent: :destroy
  has_many :references, dependent: :destroy
  has_many :note_comments ,dependent: :destroy
  has_many :favorites , dependent: :destroy
  has_many :favorited_users , through: :favorites , source: :user

  def self.looks(word)
    Note.where("title LIKE?", "%#{word}%")
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  validates :title ,presence: true
  validates :can ,presence: true
  validates :conclude ,presence: true

  accepts_nested_attributes_for :texts, allow_destroy: true
  accepts_nested_attributes_for :references, allow_destroy: true

  enum publish_status: {
    publish: 0,
    nonpublic: 1
  }

end
