class RestaurantsController < ApplicationController
  # We retrieve the restaurant instance from the params only for the actions below
  before_action :set_restaurant, only: :show

  def index
    @restaurants = Restaurant.all
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
      }
    end
  end

  def show; end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
