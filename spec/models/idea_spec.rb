require 'rails_helper'

RSpec.describe Idea, type: :model do
  before do
    @idea = build(:idea)
  end

  it "is valid with body and category" do
    expect(@idea).to be_valid
  end

  it "is invlid without body" do
    @idea.body = ''
    @idea.valid?
    expect(@idea.errors[:body]).to include("can't be blank")
  end
end
