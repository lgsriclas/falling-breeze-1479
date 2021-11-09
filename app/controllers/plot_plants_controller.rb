class PlotPlantsController < ApplicationController
  def index
    @plot = Plot.find(params[:plot_id])
    @plants = @plot.plants
  end

  def destroy
    @plot = Plot.find(params[:plot_id])
    @plant = Plant.find(params[:plant_id])
    @plants = @plot.plants
    @plants.destroy
    redirect_to '/plots'
  end
end