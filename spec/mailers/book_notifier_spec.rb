require "rails_helper"

RSpec.describe BookNotifier, type: :mailer do
  describe 'wish' do
    let(:user) { FactoryGirl.create(:user) }
    let(:owner) { FactoryGirl.create(:user) }
    let(:book) { FactoryGirl.create(:book, user_id: owner.id) }
    let(:mail) { BookNotifier.wish(user, book) }

    it 'sends to book owner' do
      expect(mail.to).to eql [owner.email]
    end

    it 'renders the senders email' do
      expect(mail.from).to eql ['no-reply@duderamos.com']
    end

    it "renders the reply-to with user email" do
      expect(mail.reply_to).to eql [user.email]
    end
  end
end
