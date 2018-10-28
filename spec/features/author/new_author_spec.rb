require 'rails_helper'

describe 'New author page', type: :feature do
  before :each do
    visit new_author_path
  end

  it 'should render withour error' do
  end

  it 'should have input fields for first_name, last_name and homepage' do
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it 'should create a new user when the form is filled' do
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click
  end

  it 'should not create a new user if no last name is provided' do
    expect(page).to_not have_text('error')
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click
    expect(page).to have_text('error')
    expect(page).to have_text('Last name', count: 2)
  end
end