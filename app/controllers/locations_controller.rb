class LocationsController < ApplicationController
  before_action :set_trip
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    @location = @trip.locations.new(location_params)
    if @location.save
      Address.create(street:"", city:"", state:"", zipcode: nil , location_id: @location.id)
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to trip_path(@trip)
  end


  private

  def location_params
    params.require(:location).permit(:name, :attraction)
  end

  def set_location
    @location = @trip.locations.find(params[:id])
  end

  def set_trip
    @trip = current_user.trips.find(params[:trip_id])
  end

  def set_address
    @address = @location.address
  end

end
