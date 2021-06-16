require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = build(:category)
  end

  it "is valid with a name" do
    expect(@category).to be_valid
  end

  it "is invalid without a name" do
    @category.name = ''
    @category.valid?
    expect(@category.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    category = create(:category)
    @category.name = category.name
    @category.valid?
    expect(@category.errors[:name]).to include("has already been taken")
  end

  it "can has many ideas" do
    category = create(:category, :with_ideas)
    expect(category.ideas.length).to eq 5
  end
end
