class EventMailer < ApplicationMailer
  def notification(from_address, to_addresses, event)
    mail to: to_addresses, from: from_address, subject: event.title, body: ""
  end
end
