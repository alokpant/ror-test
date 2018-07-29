class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    puts params[:id]
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    puts 'create ese'
    puts post_params
    @task = Task.new(post_params)
    @task.save
    redirect_to(:action => 'index')
  end

  def update
    puts 'update ese'
    @task = Task.find(params[:id])
    if @task.update(post_params)
      redirect_back()
    else
      render 'edit'
    end
  end

  private def post_params
    params.require(:task).permit(:description, :is_done, :id)
  end
end
