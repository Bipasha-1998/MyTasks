class TasksController < ApplicationController
  before_action :set_statuses, only: [:new, :create]

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = current_user.tasks.build
  end

   def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:notice] = "Task successfully created"
      redirect_to tasks_path
    else
      flash[:alert] = "Something went wrong"
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :deadline)
  end

  def set_statuses
    @statuses = ['Backlog', 'In-progress', 'Done']
  end
end
