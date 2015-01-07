class Post < ActiveRecord::Base
  # Starting from 0
  enum status: [:draft, :released, :deleted]

  belongs_to :user

  scope :draft, -> { where(status: 0) }
  scope :released, -> { where(status: 1) }
  scope :deleted, -> { where(status: 2) }
end
