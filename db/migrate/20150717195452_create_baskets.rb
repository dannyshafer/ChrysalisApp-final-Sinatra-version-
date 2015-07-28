class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
