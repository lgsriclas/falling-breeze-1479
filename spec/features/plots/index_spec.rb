require 'rails_helper'

RSpec.describe 'plots index page' do
  before :each do
    @turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
    @library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
    @other_garden = Garden.create!(name: 'Main Street Garden', organic: false)

    @plot_1 = @turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    @plot_2 = @turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
    @plot_3 = @library_garden.plots.create!(number: 2, size: "Small", direction: "South")
    @plot_4 = @other_garden.plots.create!(number: 738, size: "Medium", direction: "West")

    @plant_1 = Plant.create!(name: "Red Bell Pepper", description: "Can grow anywhere!", days_to_harvest: 60)
    @plant_2 = Plant.create!(name: "Basil", description: "Easy to care for.", days_to_harvest: 20)
    @plant_3 = Plant.create!(name: "Purple Sweet Potato", description: "Prevers rich, well draining soil.", days_to_harvest: 100)
    @plant_4 = Plant.create!(name: "Thyme", description: "Plant it and forget it.", days_to_harvest: 30)

    @pp_1 = PlotPlant.create!(plot: @plot_1, plant: @plant_1)
    @pp_2 = PlotPlant.create!(plot: @plot_1, plant: @plant_2)
  end

  it 'lists all plot numbers do' do
    visit "/plots"

    expect(page).to have_content(@plot_1.number)
    expect(page).to have_content(@plot_2.number)
    expect(page).to have_content(@plot_3.number)
    expect(page).to have_content(@plot_4.number)
  end

  it 'lists all plants under each plot number' do
    visit "/plots"

    expect(page).to have_content(@plant_1.name)
    expect(page).to have_content(@plant_2.name)
  end

  it 'has a link to remove plant from plot' do
    visit "/plots"

    expect(page).to have_link "Remove #{@plant_1.name}"
    expect(page).to have_link "Remove #{@plant_2.name}"
  end

  it 'redirects to plots index after removing plant from plot ' do
    visit "/plots"

    within("#pp-#{@pp_1.id}") do
      click_link "Remove #{@plant_1.name}"
    end

    expect(current_path).to eq("/plots")
    expect(page).to_not have_content(@plant_1.name)
  end
end