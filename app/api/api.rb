class API < Grape::API
  format "json"
  formatter :json, Grape::Formatter::Jbuilder

  rescue_from ActiveRecord::RecordNotFound do |e|
    rack_response({ error: {message: e.message} }.to_json, 404)
  end

  helpers do
    def event_params
      ActionController::Parameters.new(params).permit(:title, :note)
    end
    
    def answer_params
      ActionController::Parameters.new(params).permit(:event_id, :name)
    end
  end

  resources "events" do
    # get /api/events/:id
    params do
      requires :id, type: Integer, desc: "Event id."
    end
    desc "イベントを返します"
    get ":id", jbuilder: "events/show" do
      @event = Event.find(params[:id])
    end

    # post /api/events
    params do
      requires :title, type: String, desc: "Event title."
    end
    desc "イベントを新規登録します"
    post "/", jbuilder: "events/show" do
      @event = Event.new(event_params) do |event|
        # 候補日
        event.candidates.build((params['dates'] || []).map {|v| {:date => v}})
      end
      @event.save
    end

    # post /api/events/:id/send_mail
    params do
      requires :id, type: Integer, desc: "Event id."
    end
    desc "イベントの通知メールを送信します"
    post ":id/send_mail", jbuilder: "events/show" do
      @event = Event.find(params[:id])
      
      mailer = EventMailer.notification(params[:from_address], params[:to_addresses], @event)
      mailer.body = <<BODY
次のアドレスを開いて、都合のいい日時を○×で記入してください。

#{headers["Origin"]}/#/events/#{@event.id}/answers

#{@event.title}
---
#{@event.note}
BODY
      mailer.deliver_now
    end
    
    params do
      requires :event_id, type: Integer, desc: "Event id."
    end
    route_param :event_id do
      resources "answers" do
        post "/", jbuilder: "answers/show" do
          @answer = Answer.new(answer_params)
          @answer.joins.build((params[:dates] || []).map{|date| {
            candidate_id: Candidate.where(event_id: params[:event_id], date: date).first.try(:id)
          }})
          @answer.save
        end
      end
    end
  end
end
