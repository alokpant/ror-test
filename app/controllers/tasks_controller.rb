class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new post_params
    @task.save
  end

  private def post_params
    params.require(:task).permit(:description, :is_done)
  end
end
