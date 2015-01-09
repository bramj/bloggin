class Post < ActiveRecord::Base
  # Starting from 0
  enum status: [:draft, :released, :deleted]

  belongs_to :user

  scope :draft, -> { where(status: statuses[:draft]) }
  scope :released, -> { where(status: statuses[:released]) }
  scope :deleted, -> { where(status: statuses[:deleted]) }
end
