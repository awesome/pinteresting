require 'spec_helper.rb'

describe Board do

  let(:member) { FactoryGirl.create(:member) }

  it "is valid with a name, category and associated member" do
    expect(build(:board)).to be_valid
  end

  it "is valid without a description" do
    expect(build(:board, description: nil)).not_to have(1).errors_on(:description)
  end

  it "is invalid without a name" do
    expect(build(:board, name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid with a duplicate name for a given member" do
    existing_board = create(:board)
    expect(Board.new(name: existing_board.name, member_id: existing_board.member_id)).to have(1).errors_on(:name)
  end

  it "is invalid without a category" do
    expect(build(:board, category: nil)).to have(1).errors_on(:category)
  end

  it "is invalid without an associated member" do
    expect(build(:board, member_id: nil)).to have(1).errors_on(:member_id)
  end
end
