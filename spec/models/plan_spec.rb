require 'rails_helper'

RSpec.describe Plan, type: :model do
  it "未入力" do
    expect(build(:plan, :blank)).not_to be_valid
  end
  
  it "全て入力" do
    expect(build(:plan, :full)).to be_valid
  end
end
