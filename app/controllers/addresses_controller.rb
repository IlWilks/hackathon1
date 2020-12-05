class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_trip
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
  end

  def new
    @address = Address.new()
  end

  def create
    @address = @location.address.new(address_params)
    if @address.save
      redirect_to trip_location_path(@trip,@location)
    else
      render :new
    end
  end



  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to trip_location_path(@trip,@location)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    Address.create(street:"", city:"", state:"", zipcode: nil , location_id: @location.id)
    redirect_to trip_location_path(@trip,@location)

  end

  private

  def set_address
    @address = @location.address
  end

  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_trip
    @trip = @location.trip
  end

  def address_params
    params.require(:address).permit(:street, :city, :state, :zipcode)
  end
end
