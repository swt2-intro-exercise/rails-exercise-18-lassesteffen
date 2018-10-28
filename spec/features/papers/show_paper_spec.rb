describe 'paper/show' do
  before :each do
    @paper = FactoryBot.create :paper
    visit paper_path(@paper)
  end

  it 'should show all author for the paper' do
    expect(page).to have_text('Authors')
    expect(page).to have_text(@paper.authors.first.first_name)
  end
end