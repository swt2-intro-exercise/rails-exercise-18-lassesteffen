require 'rails_helper'

describe Author, type: :model do

  let(:first_name) { 'Alan' }
  let(:last_name) { 'Turing' }
  let(:homepage) { 'http://wikipedia.org/Alan_Turing' }

  before :each do
    @author = Author.new(first_name: first_name, last_name: last_name, homepage: homepage)
  end


  context 'with all needed fields specified' do
    it 'should create a new instance of type' do
      expect(@author.first_name).to eq(first_name)
      expect(@author.last_name).to eq(last_name)
      expect(@author.homepage).to eq(homepage)
    end

    it 'should have a property name which combines first and last name' do
      expect(@author.name).to eq('Alan Turing')
    end
  end

  context 'without a last name' do
    let(:last_name) { '' }

    it 'should not validate' do
      expect(@author).to_not be_valid
    end
  end
end
