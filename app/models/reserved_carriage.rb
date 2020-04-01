class ReservedCarriage < ApplicationRecord
  validates :upper_places, presence: true
  validates :bottom_places, presence: true
  belongs_to :train
end