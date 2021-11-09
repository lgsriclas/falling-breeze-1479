class Garden < ApplicationRecord
  has_many :plots

  def less_than_100_days
    plots.joins(:plants).where('plants.days_to_harvest < 100').distinct.group(:id, :plant_id).pluck(:plant_id)
  end
end
