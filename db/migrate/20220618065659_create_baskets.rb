class CreateBaskets < ActiveRecord::Migration[6.1]
  def change
    create_table :baskets do |t|
      t.integer :capacity 
      t.text :fill_rate 

      t.timestamps
    end
  end
end
