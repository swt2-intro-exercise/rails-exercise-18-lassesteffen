require 'rails_helper'

describe "New authors page", type: :feature do

  it "should render withour error" do
    visit new_author_path
  end

  it "should have input fields for first_name, last_name and homepage" do
    visit new_author_path
    expect(page).to have_field('authors[first_name]')
    expect(page).to have_field('authors[last_name]')
    expect(page).to have_field('authors[homepage]')
  end

  it "should create a new user when the form is filled" do
    visit new_author_path
    page.fill_in 'authors[first_name]', with: 'Alan'
    page.fill_in 'authors[last_name]', with: 'Turing'
    page.fill_in 'authors[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click
  end
end