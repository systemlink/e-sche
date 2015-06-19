require 'rails_helper'

RSpec.describe Candidate, type: :model do
  it "未入力" do
    expect(build(:candidate, :blank)).not_to be_valid
  end
  
  it "全て入力" do
    expect(build(:candidate, :full)).to be_valid
  end
end
