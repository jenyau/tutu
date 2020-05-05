class Carriage < ApplicationRecord
  belongs_to :train


  before_validation :generation_number

  validates :number, uniqueness: { scope: :train_id, message: "Сarriage with the same number already exists" }

  scope :economy, -> {where(type: 'EconomyCarriage').order(:number)}
  scope :sv, -> {where(type: 'SvCarriage').order(:number)}
  scope :coupe, -> {where(type: 'CoupeCarriage')}
  scope :seats, -> {where(type: 'SeatsCarriage').order(:number)}
  scope :ordered, -> {order('number DESC')}
  
  private
  def generation_number
    count = 1
    self.number = 0
    while self.number != count
      if train.carriages.where(number: count).exists?
        count += 1
      else
        self.number = count
      end
    end
  end
end
