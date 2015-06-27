require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /api/events/:id.json" do
    before do
      @event = FactoryGirl.create(:event, :full)
      get "/api/events/#{@event.id}.json"
    end

    it "200 OK が返ってくる" do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "イベント情報を取得出来る" do
      body = response.body
      expect(body).to have_json_path('event')
      expect(body).to have_json_path('event/title')
      expect(body).to have_json_path('event/note')
      expect(body).to be_json_eql(%("#{@event.title}")).at_path('event/title')
      expect(body).to be_json_eql(%("#{@event.note}")).at_path('event/note')
      expect(body).to be_json_eql(@event.id).at_path('event/id')
    end
=begin
    it "works! (now write some real specs)" do
      get events_path
      expect(response).to have_http_status(200)
    end
=end
  end
end
