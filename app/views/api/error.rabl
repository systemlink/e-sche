object false

messages = []
@errors.full_messages.each do |m|
  messages << m
end

node(:error) do
  {
    :message => messages
  }
end 

