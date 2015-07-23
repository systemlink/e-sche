json.answer do
  json.event_id @answer.event_id
  json.joins @answer.joins, :candidate_id
end
if @answer.errors.any?
  json.error do
    json.message @answer.errors.full_messages.to_a
  end
end
