class AddTimesToRailwayStationsRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :railway_stations_routes, :arrival, :time
    add_column :railway_stations_routes, :departure, :time
  end
end
