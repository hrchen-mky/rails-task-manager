class TasksController < ApplicationController
  before_action :set_task , only: [:delete, :show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    # raise
    # @task = Task.find(params[:id])
  end

  def create
    task = Task.create(title: params[:title], details: params[:details], completed: false)
    redirect_to task_path(task[:id])
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task[:id])
  end

  def delete
    # @task = Task.find(params[:id])
    @task.delete
    redirect_to tasks_path
  end


  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
