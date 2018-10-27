require 'rails_helper'

describe 'author/index', type: :feature  do

  before :each do
    @author = FactoryBot.create :author
    @author2 = FactoryBot.create :author, first_name: 'Franz'
    visit authors_path
  end

  it 'should render without error' do
  end

  it 'should have a authors table' do
    expect(page).to have_table('authors')
  end

  it 'should show all created authors' do
    expect(page).to have_text(@author.name)
    expect(page).to have_link(@author.name, href: author_path(@author))
    expect(page).to have_text(@author2.name)
    expect(page).to have_link(@author2.name, href: author_path(@author2))
  end

  it 'should have a link to their homepage' do
    expect(page).to have_link(@author.homepage, href: "https://#{@author.homepage}")
    expect(page).to have_link(@author2.homepage, href: "https://#{@author2.homepage}")
  end

  it 'should have a link to the edit author page' do
    expect(page).to have_link('Edit', href: edit_author_path(@author))
    expect(page).to have_link('Edit', href: edit_author_path(@author2))
  end

  it 'should have a link to create a new author' do
    expect(page).to have_link('Create new author', href: new_author_path)
  end

  it 'should have a link to go back to the home page' do
    expect(page).to have_link('Back', href: root_path)
  end
end