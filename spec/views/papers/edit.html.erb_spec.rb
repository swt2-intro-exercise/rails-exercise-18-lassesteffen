require 'rails_helper'

RSpec.describe "papers/edit", type: :view do
  before(:each) do
    @paper = FactoryBot.create :paper
  end

  it "renders the edit paper form" do
    render

    assert_select "form[action=?][method=?]", paper_path(@paper), "post" do

      assert_select "input[name=?]", "paper[title]"

      assert_select "input[name=?]", "paper[venue]"

      assert_select "input[name=?]", "paper[year]"
    end
  end

  it 'has a select multiple for selecting author' do
    render
    expect(rendered).to have_css('select[multiple]')
    expect(rendered).to have_text('Alan')
  end
end
