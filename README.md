# Task Manager

Task Manager is a web application built using Ruby on Rails that allows users to manage their tasks. Users can create, update, and delete tasks, as well as set deadlines and track task statuses.

# Features
- User authentication: Users can sign up, sign in, and sign out to manage their tasks.
- Task management: Users can create new tasks, update existing tasks, and delete tasks.
- Task status tracking: Tasks have three states - Backlog, In-progress, and Done. Users can update the status of tasks as they progress.
- Deadline tracking: Each task has a deadline defined, allowing users to track when tasks need to be completed.
- Email alerts: Users receive email alerts 1 day and 1 hour before the deadline if the task is marked as not done.

# Installation
  1. Clone the repository:
    `git clone <repository-url>`

  2. Install dependencies:
    `bundle install`

  3. Set up the database:
    `rails db:create`
    `rails db:migrate`

  4. Configure SMTP settings:
    Update the SMTP configuration in config/environments/development.rb:
      config.action_mailer.delivery_method = :smtp
      config.action_mailer.smtp_settings = {
        address: 'smtp.gmail.com',
        port: 587,
        domain: 'example.com',
        user_name: '<your-email>',
        password: '<your-password>',
        authentication: 'plain',
        enable_starttls_auto: true
      }

  5. Start the server:
    `rails s`

  # Usage
    - Open your web browser and navigate to http://localhost:3000.
    - Sign up or sign in to manage your tasks.
    - Create, update, and delete tasks as needed.
    - Track task statuses and deadlines.

  # Testing
    1. Install RSpec: `bundle install`
    2. Run tests: `rspec`
