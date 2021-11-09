class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  def edit
    @plot = Plot.find(params[:id])
  end

  def update
    @plot = Plot.find(params[:id])
    plot.update(plot_params)
    redirect_to '/plots'
  end

  private
  def plot_params
    params.permit(:id, :number, :size, :direction)
  end
end