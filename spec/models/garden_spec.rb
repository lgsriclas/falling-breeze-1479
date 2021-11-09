require 'rails_helper'

RSpec.describe Garden do
  before :each do
    @turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)

    @plot_1 = @turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    @plot_2 = @turing_garden.plots.create!(number: 26, size: "Small", direction: "West")

    @plant_1 = Plant.create!(name: "Red Bell Pepper", description: "Can grow anywhere!", days_to_harvest: 60)
    @plant_2 = Plant.create!(name: "Basil", description: "Easy to care for.", days_to_harvest: 20)
    @plant_3 = Plant.create!(name: "Purple Sweet Potato", description: "Prevers rich, well draining soil.", days_to_harvest: 100)
    @plant_4 = Plant.create!(name: "Thyme", description: "Plant it and forget it.", days_to_harvest: 30)

    @pp_1 = PlotPlant.create!(plot: @plot_1, plant: @plant_1)
    @pp_2 = PlotPlant.create!(plot: @plot_1, plant: @plant_2)
    @pp_3 = PlotPlant.create!(plot: @plot_1, plant: @plant_3)
  end

  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'instance methods' do
    it 'less than 100 days to harvest' do
      expect(@turing_garden.less_than_100_days).to eq([@plant_1.id, @plant_2.id])
    end
  end
end
