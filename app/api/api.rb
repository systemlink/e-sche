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
      # 候補日
      dates = (params['dates'] || []).map {|v| {:date => v}}
      @event.candidates.build(dates) if dates.present?
      if @event.save
        render rabl: "event"
      else
        @errors = @event.errors
        render rabl: "error"
      end
    end

    # post /api/events/:id/send_mail
    params do
      requires :id, type: Integer, desc: "Event id."
    end
    desc "イベントの通知メールを送信します"
    post ":id/send_mail", rabl: "event" do
      @event = Event.find(params[:id])
      
      mailer = EventMailer.notification(params[:from_address], params[:to_addresses], @event)
      mailer.body = <<BODY
次のアドレスを開いて、都合のいい日時を○×で記入してください。

#{headers["Origin"]}/#/events/#{@event.id}

#{@event.title}
---
#{@event.note}
BODY
      mailer.deliver_now
    end
  end
end
