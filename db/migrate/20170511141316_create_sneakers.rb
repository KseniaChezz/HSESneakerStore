class CreateSneakers < ActiveRecord::Migration[5.0]
  def change
    create_table :sneakers do |t|
      t.integer :brand_id
      t.string :model
      t.string :sex
      t.integer :price

      t.timestamps
    end
  end
end
