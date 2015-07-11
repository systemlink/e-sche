require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /api/events/:id.json" do

    let(:event) do
      FactoryGirl.create(:event, :full)
    end

    context "レコードが存在する場合" do
      before do
     #   @event = FactoryGirl.create(:event, :full)
        get "/api/events/#{event.id}.json"
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
        expect(body).to be_json_eql(%("#{event.title}")).at_path('event/title')
        expect(body).to be_json_eql(%("#{event.note}")).at_path('event/note')
        expect(body).to be_json_eql(event.id).at_path('event/id')
      end
    end

    context "レコードが存在しない場合" do
      before do
        event.delete 
        get "/api/events/#{event.id}.json"
      end
      it "400 NotFound が返ってくる" do
        expect(response.status).to eq(404)
      end
      it "エラーメッセージのjsonを返す" do
        body = response.body
        expect(body).to have_json_path('error')
        expect(body).to have_json_path('error/message')
      end
    end
  end
  describe "POST /api/events.json" do
    context "パラメタが正しい場合" do
      before do
        @params = {title: "foo", note: "bar"}
        # @params = FactoryGirl.attributes_for(:event)
      end

      it "201 created が返ってくる" do
        post "/api/events", @params
        expect(response).to be_success
        expect(response.status).to eq(201)
      end
      it "登録したイベントと同じ内容でレスポンスする" do
        post "/api/events", @params
        body = response.body
        expect(body).to have_json_path('event')
        expect(body).to have_json_path('event/title')
        expect(body).to have_json_path('event/note')
        expect(body).to be_json_eql(%("#{@params[:title]}")).at_path('event/title')
        expect(body).to be_json_eql(%("#{@params[:note]}")).at_path('event/note')
      end
      it "Event の件数が１件増える" do
        expect {
          post "/api/events", @params
        }.to change(Event, :count).by(1)
      end
    end
    context "パラメタが正しくない場合" do
      context "タイトルに入力がない場合" do
        before do
          @params = {title: "", note: ""}
          post "/api/events", @params
        end
        it "HTTP STATUS は201 Created が返える" do
          expect(response.status).to eq(201)
        end
        it "エラーメッセージの json を返す" do
          body = response.body
          expect(body).to have_json_path('error')
          expect(body).to have_json_path('error/message')
        end
      end
    end
  end
end
