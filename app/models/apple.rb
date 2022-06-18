class Apple < ApplicationRecord
  include Blending
  belongs_to :basket
  after_save :update_fill_rate
  
  def update_fill_rate
    total_count = Apple.where(basket_id: basket_id).count
    fill_rate = (total_count.to_f/basket.capacity.to_f)*100
    basket.update_attributes(fill_rate: fill_rate)
  end
end
