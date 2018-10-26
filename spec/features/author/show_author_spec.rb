require 'rails_helper'

describe 'Show author page', type: :feature do

  before :each do
    @alan = FactoryBot.create :author
  end

  it 'should render without error' do
    visit author_path(@alan)
  end

  it 'should have information about the author' do
    visit author_path(@alan)
    expect(page).to have_text(@alan.first_name)
    expect(page).to have_text(@alan.last_name)
    expect(page).to have_text(@alan.homepage)
    expect(page).to have_text(@alan.name)
  end
end