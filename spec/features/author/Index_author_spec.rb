require 'rails_helper'

describe 'author/index', type: :feature  do

  before :each do
    @author = FactoryBot.create :author
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
  end

  it 'should have a link to create a new author' do
    expect(page).to have_link('Create new author', href: new_author_path)
  end

  it 'should have a link to go back to the home page' do
    expect(page).to have_link('Back', href: root_path)
  end
end