class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :update, :destroy]

  def index
    @vehicles = Vehicle.all
  end

  def show
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      render :show, status: :created, location: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  def update
    if @vehicle.update(vehicle_params)
      render :show, status: :ok, location: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:name, :state_id)
  end
end
