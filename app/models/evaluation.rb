class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :flower

  validates :user_id, uniqueness: {scope: :flower_id}
end
