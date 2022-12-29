class Note < ApplicationRecord
  belongs_to :user
  has_many :texts

  validates :title ,presence: true
  validates :can ,presence: true
  validates :conclude ,presence: true

  accepts_nested_attributes_for :texts, allow_destroy: true

end
