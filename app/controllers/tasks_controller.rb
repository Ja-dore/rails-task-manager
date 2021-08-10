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
    redirect_to task_path(@task)
    # redirect_to '/tasks' is similar, but the readability is much bigger
    # the easiness to adapt afterwards aswell
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params_tasks)

    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private

  def params_tasks
    params.require(:task).permit(:title, :details)
  end
end
