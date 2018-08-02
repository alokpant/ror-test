class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @submit_url = task_path
    @task = Task.find(params[:id])
  end

  def new
    @submit_url = tasks_path
    @task = Task.new
  end

  def create
    puts post_params
    @task = Task.new(post_params)
    @task.save
    redirect_back fallback_location: 'pages#index'
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(post_params)
      redirect_back fallback_location: 'pages#index'
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy
    redirect_back fallback_location: 'pages#index'
  end

  def mark_as_done
    puts params
    @task = Task.find(params[:task_id])

    @task.is_done = true
    if @task.save
      redirect_back fallback_location: 'pages#index'
    else
      render 'edit'
    end
  end

  def mark_as_undone
    @task = Task.find(params[:task_id])

    @task.is_done = false
    if @task.save
      redirect_back fallback_location: 'pages#index'
    else
      render 'edit'
    end
  end

  private def post_params
    params.require(:task).permit(:description, :is_done, :id)
  end
end
