class Flower < ApplicationRecord
  belongs_to :user
  has_one :spot
end
