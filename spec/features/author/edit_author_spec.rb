describe 'author/edit', type: :feature do
  before :each do
    @author = FactoryBot.create :author
    visit edit_author_path(@author)
  end

  it 'should render without error' do
  end
end