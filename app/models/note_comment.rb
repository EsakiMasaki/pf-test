class NoteComment < ApplicationRecord
  belongs_to :user
  belongs_to :note

  validates :comment, presence: true
  
  enum post_status: {
    comment: 0,
    memo: 1
  }
end
