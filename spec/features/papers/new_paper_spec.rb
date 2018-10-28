require 'rails_helper'

describe 'New paper page', type: :feature do
  before :each do
    visit new_paper_path
  end

  it 'should not create a new paper without a title' do
    page.fill_in 'paper[venue]', with: 'Berlin'
    page.fill_in 'paper[year]', with: '2020'
    find('input[type="submit"]').click
    expect(page).to have_text('error')
  end

  it 'should not create a new paper without a venue' do
    page.fill_in 'paper[title]', with: 'Paper XY'
    page.fill_in 'paper[year]', with: '2020'
    find('input[type="submit"]').click
    expect(page).to have_text('error')
  end

  it 'should not create a new paper without a year' do
    page.fill_in 'paper[title]', with: 'Paper XY'
    page.fill_in 'paper[venue]', with: 'Berlin'
    find('input[type="submit"]').click
    expect(page).to have_text('error')
  end

  it 'should only create new papers with numeric years' do
    page.fill_in 'paper[title]', with: 'Paper XY'
    page.fill_in 'paper[venue]', with: 'Berlin'
    page.fill_in 'paper[year]', with: '19ab'
    find('input[type="submit"]').click
    expect(page).to have_text('error')
  end
end