class API < Grape::API
  format "json"
  formatter :json, Grape::Formatter::Rabl

  rescue_from ActiveRecord::RecordNotFound do |e|
    rack_response({ error: {message: e.message} }.to_json, 404)
  end

  helpers do
    def event_params
      ActionController::Parameters.new(params).permit(:title, :note)
    end
  end

  resource "events" do
    # get /api/events/:id
    params do
      requires :id, type: Integer, desc: "Event id."
    end
    desc "イベントを返します"
    get ":id", rabl: "event" do
      @event = Event.find(params[:id])
    end

    # post /api/events
    params do
      requires :title, type: String, desc: "Event title."
    end
    desc "イベントを新規登録します"
    post "/" do
      @event = Event.new(event_params)
      if @event.save
        render rabl: "event"
      else
        @errors = @event.errors
        render rabl: "error"
      end
    end
  end
end
