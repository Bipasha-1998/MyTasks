namespace :tasks do
  desc 'Task remider notification'
  task task_reminder: :environment do
    Task.where.not(status: 'Done')
        .where('deadline BETWEEN ? AND ?', 1.day.from_now, 1.day.from_now + 1.hour)
        .find_each do |task|
      TaskMailer.reminder_email(task).deliver_now
    end

    Task.where.not(status: 'Done')
        .where('deadline BETWEEN ? AND ?', 1.hour.from_now, 1.hour.from_now + 1.minute)
        .find_each do |task|
      TaskMailer.reminder_email(task).deliver_now
    end
  end
end
