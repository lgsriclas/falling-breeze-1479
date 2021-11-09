require 'rails_helper'

RSpec.describe 'plots index page' do
  before :each do
    @turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
    @library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
    @other_garden = Garden.create!(name: 'Main Street Garden', organic: false)

    @plot_1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    @plot_2 = turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
    @plot_3 = library_garden.plots.create!(number: 2, size: "Small", direction: "South")
    @plot_4 = other_garden.plots.create!(number: 738, size: "Medium", direction: "West")
  end

  it 'lists all plot numbers do' do
    visit '/plots'

    expect(page).to have_content(@plot_1.number)
    expect(page).to have_content(@plot_2.number)
    expect(page).to have_content(@plot_3.number)
    expect(page).to have_content(@plot_4.number)
  end
end