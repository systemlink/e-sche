object @errors => :error

node(:message)  do 
  @errors.full_messages 
end
