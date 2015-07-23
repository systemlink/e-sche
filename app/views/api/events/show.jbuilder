json.event do
  json.id @event.id
  json.title @event.title
  json.note @event.note
  json.dates @event.candidates do |candidate|
    json.date candidate.date
    json.answers candidate.joins do |join|
      json.name join.answer.name
    end
  end
  json.answers @event.answers do |answer|
    json.name answer.name
  end
end
if @event.errors.any?
  json.error do
    json.message @event.errors.full_messages.to_a
  end
end
