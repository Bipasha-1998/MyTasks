require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { User.create(name: "User", email: 'test@example.com', password: 'password') }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      task = Task.new(title: 'Test Task', deadline: Date.today, status: 'Backlog', user: user)
      expect(task).to be_valid
    end

    it 'is not valid without a title' do
      task = Task.new(deadline: Date.today, status: 'Backlog', user: user)
      expect(task).to_not be_valid
    end

    it 'is not valid with a title shorter than 5 characters' do
      task = Task.new(title: 'Test', deadline: Date.today, status: 'Backlog', user: user)
      expect(task).to_not be_valid
    end

    it 'is not valid with a title longer than 50 characters' do
      task = Task.new(title: 'a' * 51, deadline: Date.today, status: 'Backlog', user: user)
      expect(task).to_not be_valid
    end

    it 'is not valid without a deadline' do
      task = Task.new(title: 'Test Task', status: 'Backlog', user: user)
      expect(task).to_not be_valid
    end

    it 'is not valid without a status' do
      task = Task.new(title: 'Test Task', deadline: Date.today, status: nil, user: user)
      expect(task).to_not be_valid
    end
  end

  describe 'Methods' do
    it 'returns valid statuses' do
      expect(Task.statuses).to eq(['Backlog', 'In-progress', 'Done'])
    end
  end
end
