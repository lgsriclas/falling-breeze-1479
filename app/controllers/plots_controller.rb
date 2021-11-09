class PlotController < ApplicationController
  def index
    @plot = Plot.find(params[:id])
  end 
end