namespace :add_apple_to_basket1 do 
  desc "Addming apple to basket"
  task :add, [:variety, :count] => [:environment] do |task, args|
      data = args.to_a
      range = Basket.check_limit('capacity').present? ? (1..data[1].to_i).to_a : []
      unless range.present?
        Rails.logger.info  "All baskets are full. We couldn't find the place for #{data[1]} apples."
        puts  "All baskets are full. We couldn't find the place for #{data[1]} apples."
        next
      end
      remaining_apples = 0
      cut_off = false
      range.each do |rec|
        zero_or_one = Basket.check_limit(2) unless cut_off
        capacity_check = Basket.check_limit('capacity') if zero_or_one.nil? or zero_or_one.count < 1
        if zero_or_one.present?
          Apple.create(variety: data[0], basket_id: zero_or_one.first.id)
        elsif capacity_check.present?
          cut_off = true
          Apple.create(variety: data[0], basket_id: capacity_check.first.id)
        else
          remaining_apples += 1
        end
      end
      unless remaining_apples == 0
        Rails.logger.info  "All baskets are full. We couldn't find the place for #{remaining_apples} apples"
        puts "All baskets are full. We couldn't find the place for #{remaining_apples} apples"
      end
  end
end
