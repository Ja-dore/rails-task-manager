class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    # hier moet wel iets staan om de form_for te kunnen gebruiken
    @task = Task.new
  end

  def create
    @task = Task.new(params_tasks)
    @task.save
    # no need to create a view for create if you redirect!
    redirect_to tasks_path(@task)
  end

  private

  def params_tasks
    params.require(:task).permit(:title, :details)
  end
end
