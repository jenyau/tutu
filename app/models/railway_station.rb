class RailwayStation < ApplicationRecord
  validates :title, presence: true
  #validate :time_validates

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :trains

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }
  
  def update_arrival(route, arrival)
    station_position = station_position(route)
    station_position.update(arrival: arrival)
  end

  def update_departure(route, departure)
    station_position = station_position(route)
    station_position.update(departure: departure)
  end

  def update_position(route, position)
    station_position = station_position(route)
    station_position.update(position: position)
  end

  def position_in(route)
    station_position(route).try(:position)
  end

  def time_arrival(route)
    station_position = station_position(route)
    station_position(route).try(:arrival)
  end

  def time_departure(route)
    station_position(route).try(:departure)
  end

  protected
  def station_position(route)
    station_position = railway_stations_routes.where(route: route).first
  end
end