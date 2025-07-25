class Todo < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 255 }
  
  scope :completed, -> { where(completed: true) }
  scope :pending, -> { where(completed: false) }
  
  def as_json(options = {})
    super(only: [:id, :title, :completed, :created_at, :updated_at])
  end
end