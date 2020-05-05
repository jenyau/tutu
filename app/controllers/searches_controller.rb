class SearchesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @route_arr = []
    Route.all.each do |route|
      if route.railway_stations.where(id: params[:first]).present? &&
         route.railway_stations.where(id: params[:second]).present?

        first = route.railway_stations.where(id: params[:first]).first
        second = route.railway_stations.where(id: params[:second]).first

        if first.position_in(route).present? && second.position_in(route).present?
          if first.position_in(route) > second.position_in(route)
            @route_arr << route
          end
        else
          @user = User.find(params[:user_id])
          @route_arr << route
        end
      end
    end
  end
  end
  def new
end
