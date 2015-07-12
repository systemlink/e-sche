require "rails_helper"

RSpec.describe EventMailer, type: :mailer do
  let(:from_address) { "from_address@host.com" }
  let(:to_addresses) { "to_addresses@host.com" }
  
  before do
    @event = create(:event, :full)
    @event_mailer = EventMailer.notification(from_address, to_addresses, @event)
  end

  it "送信元アドレスが正しいこと" do
    expect(@event_mailer.from).to eq [from_address]
  end
  
  it "送信先アドレスが正しいこと" do
    expect(@event_mailer.to).to eq [to_addresses]
  end
  
  it "タイトルが正しいこと" do
    expect(@event_mailer.subject).to eq @event.title
  end
end
