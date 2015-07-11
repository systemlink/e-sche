class EventMailer < ApplicationMailer
  def notification(to_addresses, from_address, event)
    @event = event
    
    mail to: to_addresses, from: from_address, subject: event.title
  end
end
