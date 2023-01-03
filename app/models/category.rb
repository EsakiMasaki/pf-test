class Category < ApplicationRecord
  has_many :notes
  belongs_to :user

  validates :name, presence: true

  def self.looks(word)
    Category.where("name LIKE?", "%#{word}%")
  end
end
