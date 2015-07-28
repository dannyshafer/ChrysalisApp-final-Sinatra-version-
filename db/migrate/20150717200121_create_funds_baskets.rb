class CreateFundsBaskets < ActiveRecord::Migration
  def change
    create_table :funds_baskets do |t|
      t.integer :fund_id
      t.integer :basket_id

      t.timestamps
    end
  end
end
