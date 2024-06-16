require "rails_helper"

RSpec.describe TaskMailer, type: :mailer do
  let(:user) { FactoryBot.create(:user) }
  let(:task) { FactoryBot.create(:task, user: user) }

  describe '#reminder_email' do
    let(:mail) { TaskMailer.with(to: 'user1@example.com').reminder_email(task) }

    it 'renders the headers' do
      expect(mail.subject).to eq('Task Reminder')
      expect(mail.to).to eq(['user1@example.com'])
      expect(mail.from).to eq(['notifications@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to include("Reminder for Task: " + task.title)
      expect(mail.body.encoded).to include(task.description)
      expect(mail.body.encoded).to include("Deadline: " + task.deadline.to_s)
    end
  end
end
