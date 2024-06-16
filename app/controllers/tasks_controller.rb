class TasksController < ApplicationController
  before_action :set_statuses, only: [:new, :create, :edit, :update]
  before_action :set_task, only: [:edit, :update, :destroy, :update_status]
  before_action :require_user

  def index
    @tasks = current_user.tasks.where.not(status: "Done")
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

  def edit; end

  def update
    if @task.update(task_params)
      flash[:notice] = "Task updated successfully"
      redirect_to tasks_path
    else
      flash[:alert] = "Something went wrong try again"
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "Task deleted successfully"
    redirect_to tasks_path
  end

  def update_status
    if @task.update(task_status_params)
      if @task.status == "Done"
        flash[:notice] = "Task status was successfully updated."
        redirect_to completed_tasks_path
      else
        redirect_to tasks_path, notice: 'Task status was successfully updated.'
      end
    else
      redirect_to tasks_path, alert: 'Failed to update task status.'
    end
  end

  def completed
    @tasks = current_user.tasks.where(status: "Done")
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :deadline)
  end

  def set_statuses
    @statuses = ['Backlog', 'In-progress', 'Done']
  end

  def task_status_params
    params.require(:task).permit(:status)
  end

  def require_user
    redirect_to login_path unless current_user
  end
end
