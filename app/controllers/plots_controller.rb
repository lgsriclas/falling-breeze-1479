class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  private
  def plot_params
    params.permit(:id, :number, :size, :direction)
  end
end