class Note < ApplicationRecord
  belongs_to :user
  has_many :texts

  accepts_nested_attributes_for :texts, allow_destroy: true

end
