require 'rails_helper'

describe "Show author page", type: :feature do
  it "should render without error" do
    @alan = FactoryBot.create :author
    visit author_path(@alan)
  end

  it "should have information about the author" do
    @alan = FactoryBot.create :author
    visit author_path(@alan)
    expect(page).to have_text(@alan.first_name)
    expect(page).to have_text(@alan.last_name)
    expect(page).to have_text(@alan.homepage)
    expect(page).to have_text(@alan.name)
  end
end