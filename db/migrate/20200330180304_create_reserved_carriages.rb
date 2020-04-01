class CreateReservedCarriages < ActiveRecord::Migration[6.0]
  def change
    create_table :reserved_carriages do |t|
      t.string :carriage_type
      t.integer :upper_places
      t.integer :bottom_places
      t.integer :train_id
    end
  end
end
