describe 'author/edit', type: :feature do
  before :each do
    @author = FactoryBot.create :author
    visit edit_author_path(@author)
  end

  it 'should render without error' do
  end

  it 'should have all author fields with the correct values' do
    PLEASE FILL IN
  end
end