require 'rails_helper'

RSpec.describe Event, type: :model do
  it "未入力" do
    expect(build(:event, :blank)).not_to be_valid
  end
  
  it "全て入力" do
    expect(build(:event, :full)).to be_valid
  end
end
