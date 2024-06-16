class TaskMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def reminder_email(task)
    @task = task
    @user = task.user
    mail(to: @user.email, subject: 'Task Reminder')
  end
end
