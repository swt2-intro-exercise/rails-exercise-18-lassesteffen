require 'rails_helper'

RSpec.describe Paper, type: :model do
  it 'should be initialized with a list of authors' do
    @paper = FactoryBot.create :paper
    @author = FactoryBot.build :author
    expect(@paper.authors.size).to eq(1)
    expect(@paper.authors.first.first_name).to eq(@author.first_name)


  end
end
