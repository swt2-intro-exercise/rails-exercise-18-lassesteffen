describe 'author/edit', type: :feature do
  let(:new_first_name) { 'Nala' }
  let(:new_last_name) { 'Gnirut' }

  before :each do
    @author = FactoryBot.create :author
    visit edit_author_path(@author)
  end

  it 'should render without error' do
  end

  it 'should have all author fields with the correct values' do
    visit edit_author_path(@author)
    expect(page).to have_field('author[first_name]', with: @author.first_name)
    expect(page).to have_field('author[last_name]', with: @author.last_name)
    expect(page).to have_field('author[homepage]', with: @author.homepage)
  end

  it 'should save changes to the database' do
    visit edit_author_path(@author)
    page.fill_in 'author[first_name]', with: 'Nala'
    page.fill_in 'author[last_name]', with: 'Gnirut'
    find('input[type="submit"]').click
    @author.reload
    expect(@author.first_name).to eq(new_first_name)
    expect(@author.last_name).to eq(new_last_name)
  end
end