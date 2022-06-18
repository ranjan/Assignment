module Blending
  extend ActiveSupport::Concern
  
  included do
    after_save :make_juice if self.class.to_s == 'Apple'
  end
  
  def make_juice
    p 'This callback will be triggerd by class Apple'
  end
end
