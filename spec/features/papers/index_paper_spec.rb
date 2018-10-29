require 'rails_helper'

describe 'papers/index', type: :feature do
  before :each do
    @paper = FactoryBot.create :paper, year: 2012
    @paper2 = FactoryBot.create :paper, year: 2016, title: 'Filtered Paper'
  end

  it 'can filter articles by year' do
    visit papers_path(year: '2012')
    expect(page).to have_text(@paper.title)
    expect(page).to_not have_text(@paper2.title)
  end
end