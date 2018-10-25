require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:first_name) { 'Alan' }
  let(:last_name) { 'Turing' }
  let(:homepage) { 'http://wikipedia.org/Alan_Turing' }

  it 'should create a new instance of type' do
    author = Author.new(first_name: first_name, last_name: last_name, homepage: homepage)
    expect(author.first_name).to eq(first_name)
    expect(author.last_name).to eq(last_name)
    expect(author.homepage).to eq(homepage)
    expect(author.name).to eq('Alan Turing')
  end
end
