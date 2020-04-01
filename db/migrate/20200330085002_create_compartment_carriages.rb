class CreateCompartmentCarriages < ActiveRecord::Migration[6.0]
  def change
    create_table :compartment_carriages do |t|
      t.string :carriage_type
      t.integer :bottom_places
      t.integer :upper_places
      t.integer :train_id
    end
  end
end
