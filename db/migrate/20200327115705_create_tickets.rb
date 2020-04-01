class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :passenger_name
      t.string :routes_name
    end
  end
end
